; extends
;
; ~/.config/nvim/after/queries/yaml/injections.scm
;
; Neovim >= 0.10 (@injection.filename). La ligne "; extends" doit rester la
; PREMIÈRE ligne : sans elle ce fichier n'est pas fusionné avec les
; injections de nvim-treesitter (il est ignoré, ou les remplace).
;
; Un (block_scalar) contient son en-tête (`|`, `|-`, `>+`...). #offset!
; saute cet en-tête, d'où 2 variantes par règle : en-tête de 1 caractère
; (`|`, `>`) ou de 2 (`|-`, `|+`, `>-`, `|2`...). Les en-têtes plus longs
; (`|2-`) ou suivis d'un commentaire ne sont volontairement pas injectés
; (le contenu reste une simple chaîne plutôt qu'un arbre en erreur).

; ---------------------------------------------------------------------------
; 1. Clés « nom de fichier » à valeur multi-ligne
;    ConfigMap / Secret stringData / values Helm / templates ExternalSecret...
;
;      config.json: |     -> json          nginx.conf: |      -> nginx
;      app.toml: |-       -> toml          "values.yaml": |   -> yaml
;      entrypoint.sh: |   -> bash (*)      .dockerconfigjson: | -> json
;
;    Le langage est déduit par vim.filetype.match() sur le nom de la clé :
;    toute extension connue de Neovim marche si le parser est installé.
;    (*) ft `sh` -> parser `bash` : mapping fourni par nvim-treesitter,
;        sinon : vim.treesitter.language.register('bash', 'sh')
; ---------------------------------------------------------------------------

(block_mapping_pair
  key: (flow_node) @injection.filename
  value: (block_node
    (block_scalar) @injection.content)
  (#lua-match? @injection.filename "^[\"']?[%w_.-]*%.%w+[\"']?$")
  (#lua-match? @injection.content "^[|>]%s*\n")
  (#gsub! @injection.filename "^[\"']?(.-)[\"']?$" "%1")
  (#gsub! @injection.filename "^%.dockerconfigjson$" "dockerconfig.json")
  (#offset! @injection.content 0 1 0 0))

(block_mapping_pair
  key: (flow_node) @injection.filename
  value: (block_node
    (block_scalar) @injection.content)
  (#lua-match? @injection.filename "^[\"']?[%w_.-]*%.%w+[\"']?$")
  (#lua-match? @injection.content "^[|>][-+1-9]%s*\n")
  (#gsub! @injection.filename "^[\"']?(.-)[\"']?$" "%1")
  (#gsub! @injection.filename "^%.dockerconfigjson$" "dockerconfig.json")
  (#offset! @injection.content 0 2 0 0))

; ---------------------------------------------------------------------------
; 2. Patches Kustomize -> yaml (JSON6902 en JSON inclus : JSON ⊂ YAML)
;
;    - Flux Kustomization        .spec.patches[].patch
;    - Flux HelmRelease          .spec.postRenderers[].kustomize.patches[].patch
;    - kustomization.yaml        .patches[].patch / .patchesJson6902[].patch
;
;    spec:
;      patches:
;        - patch: |-
;            apiVersion: apps/v1
;            ...
;          target:
;            kind: Deployment
; ---------------------------------------------------------------------------

(block_mapping_pair
  key: (flow_node) @_patches
  value: (block_node
    (block_sequence
      (block_sequence_item
        (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_patch
              value: (block_node
                (block_scalar) @injection.content)))))))
  (#any-of? @_patches "patches" "patchesJson6902")
  (#eq? @_patch "patch")
  (#lua-match? @injection.content "^[|>]%s*\n")
  (#set! injection.language "yaml")
  (#offset! @injection.content 0 1 0 0))

(block_mapping_pair
  key: (flow_node) @_patches
  value: (block_node
    (block_sequence
      (block_sequence_item
        (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_patch
              value: (block_node
                (block_scalar) @injection.content)))))))
  (#any-of? @_patches "patches" "patchesJson6902")
  (#eq? @_patch "patch")
  (#lua-match? @injection.content "^[|>][-+1-9]%s*\n")
  (#set! injection.language "yaml")
  (#offset! @injection.content 0 2 0 0))

; Variante en ligne : patch: '[{"op": "remove", "path": "/spec/replicas"}]'
(block_mapping_pair
  key: (flow_node) @_patches
  value: (block_node
    (block_sequence
      (block_sequence_item
        (block_node
          (block_mapping
            (block_mapping_pair
              key: (flow_node) @_patch
              value: (flow_node
                [
                  (single_quote_scalar)
                  (double_quote_scalar)
                ] @injection.content)))))))
  (#any-of? @_patches "patches" "patchesJson6902")
  (#eq? @_patch "patch")
  (#set! injection.language "yaml")
  (#offset! @injection.content 0 1 0 -1))

; ---------------------------------------------------------------------------
; 3. Patch JSON6902 générique op/path/value, quand path == "/spec/patches"
;    (n'importe quelle valeur pour op : add, replace, remove...) :
;
;      - op: replace
;        path: "/spec/patches"
;        value:
;          - target:
;              kind: HelmRelease
;            patch: |-
;              apiVersion: helm.toolkit.fluxcd.io/v2
;              ...
; ---------------------------------------------------------------------------

(block_mapping
  (block_mapping_pair
    key: (flow_node) @_op)
  (block_mapping_pair
    key: (flow_node) @_path
    value: (flow_node) @_path_value)
  (block_mapping_pair
    key: (flow_node) @_value
    value: (block_node
      (block_sequence
        (block_sequence_item
          (block_node
            (block_mapping
              (block_mapping_pair
                key: (flow_node) @_patch
                value: (block_node
                  (block_scalar) @injection.content))))))))
  (#eq? @_op "op")
  (#eq? @_path "path")
  (#eq? @_value "value")
  (#eq? @_patch "patch")
  (#lua-match? @_path_value "^[\"']?/spec/patches[\"']?$")
  (#lua-match? @injection.content "^[|>]%s*\n")
  (#set! injection.language "yaml")
  (#offset! @injection.content 0 1 0 0))

(block_mapping
  (block_mapping_pair
    key: (flow_node) @_op)
  (block_mapping_pair
    key: (flow_node) @_path
    value: (flow_node) @_path_value)
  (block_mapping_pair
    key: (flow_node) @_value
    value: (block_node
      (block_sequence
        (block_sequence_item
          (block_node
            (block_mapping
              (block_mapping_pair
                key: (flow_node) @_patch
                value: (block_node
                  (block_scalar) @injection.content))))))))
  (#eq? @_op "op")
  (#eq? @_path "path")
  (#eq? @_value "value")
  (#eq? @_patch "patch")
  (#lua-match? @_path_value "^[\"']?/spec/patches[\"']?$")
  (#lua-match? @injection.content "^[|>][-+1-9]%s*\n")
  (#set! injection.language "yaml")
  (#offset! @injection.content 0 2 0 0))

; Variante en ligne : patch: '[{"op": "remove", "path": "/spec/replicas"}]'
(block_mapping
  (block_mapping_pair
    key: (flow_node) @_op)
  (block_mapping_pair
    key: (flow_node) @_path
    value: (flow_node) @_path_value)
  (block_mapping_pair
    key: (flow_node) @_value
    value: (block_node
      (block_sequence
        (block_sequence_item
          (block_node
            (block_mapping
              (block_mapping_pair
                key: (flow_node) @_patch
                value: (flow_node
                  [
                    (single_quote_scalar)
                    (double_quote_scalar)
                  ] @injection.content))))))))
  (#eq? @_op "op")
  (#eq? @_path "path")
  (#eq? @_value "value")
  (#eq? @_patch "patch")
  (#lua-match? @_path_value "^[\"']?/spec/patches[\"']?$")
  (#set! injection.language "yaml")
  (#offset! @injection.content 0 1 0 -1))
