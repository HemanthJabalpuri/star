meta:
  id: star
  title: Motorola singleimage tar archive
  file-extension: bin
  license: CC0-1.0
  endian: le
seq:
  - id: magic
    type: strz
    size: 256
    encoding: ASCII
    valid: '"SINGLE_N_LONELY"'
  - id: parts
    type: part
    repeat: until
    repeat-until: _.name == "LONELY_N_SINGLE"
types:
  part:
    seq:
      - id: name
        type: strz
        size: 248
        encoding: ASCII
      - id: len_part
        type: u8
      - size: 0
        if: ofs_part < 0
        # Above one is not a actual field. This is just to get current file pointer position using kaitai. Condition will fail but pointer position will be stored
      - id: part
        size: len_part
      - id: padding
        size: 4096 - (len_part % 4096)
        if: len_part % 4096 != 0
    -webide-representation: '{name} off:{ofs_part} len:{len_part}'
    instances:
      ofs_part:
        value: _root._io.pos
