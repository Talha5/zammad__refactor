# frozen_string_literal: true
require "mail/utilities"
require "mail/parser_tools"

module Mail::Parsers
  class PhraseListsParser
    extend Mail::ParserTools

    PhraseListsStruct = Struct.new(:phrases, :error)

    class << self
      attr_accessor :_trans_keys
      private :_trans_keys, :_trans_keys=
    end
    self._trans_keys = [
      0, 0, 9, 244, 9, 244,
      10, 10, 9, 32, 10,
      10, 9, 32, 1, 244,
      1, 244, 10, 10, 9, 32,
      0, 244, 128, 191, 160,
      191, 128, 191, 128, 159,
      144, 191, 128, 191, 128, 143,
      9, 244, 10, 10, 9,
      32, 9, 244, 128, 191,
      160, 191, 128, 191, 128, 159,
      144, 191, 128, 191, 128,
      143, 1, 244, 1, 244,
      10, 10, 9, 32, 0, 244,
      128, 191, 160, 191, 128,
      191, 128, 159, 144, 191,
      128, 191, 128, 143, 9, 244,
      9, 244, 9, 244, 0,
      0, 0,
    ]

    class << self
      attr_accessor :_key_spans
      private :_key_spans, :_key_spans=
    end
    self._key_spans = [
      0, 236, 236, 1, 24, 1, 24, 244,
      244, 1, 24, 245, 64, 32, 64, 32,
      48, 64, 16, 236, 1, 24, 236, 64,
      32, 64, 32, 48, 64, 16, 244, 244,
      1, 24, 245, 64, 32, 64, 32, 48,
      64, 16, 236, 236, 236, 0,
    ]

    class << self
      attr_accessor :_index_offsets
      private :_index_offsets, :_index_offsets=
    end
    self._index_offsets = [
      0, 0, 237, 474, 476, 501, 503, 528,
      773, 1018, 1020, 1045, 1291, 1356, 1389, 1454,
      1487, 1536, 1601, 1618, 1855, 1857, 1882, 2119,
      2184, 2217, 2282, 2315, 2364, 2429, 2446, 2691,
      2936, 2938, 2963, 3209, 3274, 3307, 3372, 3405,
      3454, 3519, 3536, 3773, 4010, 4247,
    ]

    class << self
      attr_accessor :_indicies
      private :_indicies, :_indicies=
    end
    self._indicies = [
      0, 1, 1, 1, 2, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 0,
      3, 4, 3, 3, 3, 3, 3, 5,
      1, 3, 3, 1, 3, 6, 3, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 1, 1, 1, 3, 1, 3, 6,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 1, 1, 1, 3, 3, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 3, 3, 3, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 7, 7, 7, 7, 7, 7, 7,
      7, 7, 7, 7, 7, 7, 7, 7,
      7, 7, 7, 7, 7, 7, 7, 7,
      7, 7, 7, 7, 7, 7, 7, 8,
      9, 9, 9, 9, 9, 9, 9, 9,
      9, 9, 9, 9, 10, 9, 9, 11,
      12, 12, 12, 13, 1, 14, 1, 1,
      1, 15, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 14, 16, 17, 16,
      16, 16, 16, 16, 18, 1, 16, 16,
      1, 16, 1, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 1, 1,
      1, 16, 1, 16, 1, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 1,
      1, 1, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 20, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 22, 21, 21, 23, 24, 24, 24,
      25, 1, 26, 1, 14, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 14, 1, 27, 1, 16,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 16, 1,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 1, 28, 28, 29, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 30, 28, 28, 28, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 28, 28, 31, 28, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 28,
      28, 28, 28, 28, 28, 28, 28, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 32, 32, 32, 32, 32, 32, 32,
      32, 32, 32, 32, 32, 32, 32, 32,
      32, 32, 32, 32, 32, 32, 32, 32,
      32, 32, 32, 32, 32, 32, 32, 33,
      34, 34, 34, 34, 34, 34, 34, 34,
      34, 34, 34, 34, 35, 34, 34, 36,
      37, 37, 37, 38, 1, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 1, 39,
      39, 40, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 41, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      42, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 44, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 46, 45, 45, 47, 48, 48, 48,
      49, 1, 50, 1, 39, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 39, 1, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 44, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 46, 45, 45, 47, 48, 48,
      48, 49, 1, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 39, 39, 39, 39, 39,
      39, 39, 39, 1, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 1, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 1, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 43, 43,
      43, 43, 43, 43, 43, 43, 1, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 1,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      1, 45, 45, 45, 45, 45, 45, 45,
      45, 45, 45, 45, 45, 45, 45, 45,
      45, 1, 51, 1, 1, 1, 52, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 51, 3, 4, 3, 3, 3, 3,
      3, 5, 1, 3, 3, 1, 3, 6,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 1, 1, 1, 3, 1,
      3, 6, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 3, 1, 1, 1, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 3, 3, 3, 3, 3,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 7, 7, 7, 7, 7,
      7, 7, 7, 7, 7, 7, 7, 7,
      7, 7, 7, 7, 7, 7, 7, 7,
      7, 7, 7, 7, 7, 7, 7, 7,
      7, 8, 9, 9, 9, 9, 9, 9,
      9, 9, 9, 9, 9, 9, 10, 9,
      9, 11, 12, 12, 12, 13, 1, 53,
      1, 54, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      54, 1, 55, 1, 1, 1, 56, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 55, 57, 58, 57, 57, 57, 57,
      57, 59, 1, 57, 57, 1, 57, 1,
      57, 57, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 1, 1, 1, 57, 1,
      57, 1, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 1, 1, 1, 57,
      57, 57, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 57, 57,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 60, 60, 60, 60, 60,
      60, 60, 60, 60, 60, 60, 60, 60,
      60, 60, 60, 60, 60, 60, 60, 60,
      60, 60, 60, 60, 60, 60, 60, 60,
      60, 61, 62, 62, 62, 62, 62, 62,
      62, 62, 62, 62, 62, 62, 63, 62,
      62, 64, 65, 65, 65, 66, 1, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 1,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      1, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 1, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 1, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 1, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 1, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 1, 67, 67,
      67, 67, 67, 67, 67, 67, 67, 1,
      67, 67, 68, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 69, 70, 67,
      67, 67, 67, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 67, 67, 67,
      67, 71, 67, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 67, 67, 67,
      67, 67, 67, 67, 67, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 72,
      72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72,
      72, 72, 72, 72, 72, 73, 74, 74,
      74, 74, 74, 74, 74, 74, 74, 74,
      74, 74, 75, 74, 74, 76, 77, 77,
      77, 78, 1, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 1, 79, 79, 80,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 81, 82, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 83, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 85, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 87,
      86, 86, 88, 89, 89, 89, 90, 1,
      91, 1, 79, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 79, 1, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 85, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      87, 86, 86, 88, 89, 89, 89, 90,
      1, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 79, 79, 79, 79, 79, 79, 79,
      79, 1, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 1, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 1, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 84, 84, 84, 84,
      84, 84, 84, 84, 1, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 1, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 1, 86,
      86, 86, 86, 86, 86, 86, 86, 86,
      86, 86, 86, 86, 86, 86, 86, 1,
      16, 1, 1, 1, 92, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 16,
      16, 17, 16, 16, 16, 16, 16, 93,
      1, 16, 16, 94, 16, 95, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 1, 1, 1, 16, 1, 16, 95,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 1, 1, 1, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 20,
      21, 21, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 22, 21, 21, 23,
      24, 24, 24, 25, 1, 57, 1, 1,
      1, 96, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 57, 57, 58, 57,
      57, 57, 57, 57, 97, 1, 57, 57,
      98, 57, 99, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 1, 1,
      1, 57, 1, 57, 99, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 57, 1,
      1, 1, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 57, 57, 57, 57, 57,
      57, 57, 57, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 60, 60,
      60, 60, 60, 60, 60, 60, 60, 60,
      60, 60, 60, 60, 60, 60, 60, 60,
      60, 60, 60, 60, 60, 60, 60, 60,
      60, 60, 60, 60, 61, 62, 62, 62,
      62, 62, 62, 62, 62, 62, 62, 62,
      62, 63, 62, 62, 64, 65, 65, 65,
      66, 1, 14, 1, 1, 1, 15, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 14, 16, 17, 16, 16, 16, 16,
      16, 18, 1, 16, 16, 94, 16, 95,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 1, 1, 1, 16, 1,
      16, 95, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 1, 1, 1, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 16, 16, 16, 16,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 19, 19, 19, 19, 19, 19, 19,
      19, 20, 21, 21, 21, 21, 21, 21,
      21, 21, 21, 21, 21, 21, 22, 21,
      21, 23, 24, 24, 24, 25, 1, 1,
      0,
    ]

    class << self
      attr_accessor :_trans_targs
      private :_trans_targs, :_trans_targs=
    end
    self._trans_targs = [
      2, 0, 3, 42, 7, 22, 44, 23,
      24, 25, 26, 27, 28, 29, 2, 3,
      42, 7, 22, 23, 24, 25, 26, 27,
      28, 29, 4, 6, 8, 9, 42, 11,
      12, 13, 14, 15, 16, 17, 18, 8,
      9, 42, 11, 12, 13, 14, 15, 16,
      17, 18, 10, 19, 20, 21, 19, 2,
      3, 42, 7, 22, 23, 24, 25, 26,
      27, 28, 29, 31, 32, 31, 45, 34,
      35, 36, 37, 38, 39, 40, 41, 31,
      32, 31, 45, 34, 35, 36, 37, 38,
      39, 40, 41, 33, 5, 43, 19, 44,
      5, 43, 19, 44,
    ]

    class << self
      attr_accessor :_trans_actions
      private :_trans_actions, :_trans_actions=
    end
    self._trans_actions = [
      1, 0, 1, 1, 1, 2, 1, 1,
      1, 1, 1, 1, 1, 1, 0, 0,
      0, 0, 3, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 4, 4, 5, 4,
      4, 4, 4, 4, 4, 4, 4, 0,
      0, 6, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 1, 1, 0, 0, 7,
      7, 7, 7, 8, 7, 7, 7, 7,
      7, 7, 7, 9, 9, 10, 11, 9,
      9, 9, 9, 9, 9, 9, 9, 0,
      0, 3, 12, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 3, 13, 0,
      7, 8, 14, 7,
    ]

    class << self
      attr_accessor :_eof_actions
      private :_eof_actions, :_eof_actions=
    end
    self._eof_actions = [
      0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 13, 14, 13, 0,
    ]

    class << self
      attr_accessor :start
    end
    self.start = 1
    class << self
      attr_accessor :first_final
    end
    self.first_final = 42
    class << self
      attr_accessor :error
    end
    self.error = 0

    class << self
      attr_accessor :en_comment_tail
    end
    self.en_comment_tail = 30
    class << self
      attr_accessor :en_main
    end
    self.en_main = 1

    def self.parse(data)
      data = data.dup.force_encoding(Encoding::ASCII_8BIT) if data.respond_to?(:force_encoding)

      raise Mail::Field::NilParseError.new(Mail::PhraseList) if data.nil?

      # Parser state
      phrase_lists = PhraseListsStruct.new([])
      phrase_s = nil

      # 5.1 Variables Used by Ragel
      p = 0
      eof = pe = data.length
      stack = []

      begin
        p ||= 0
        pe ||= data.length
        cs = start
        top = 0
      end

      begin
        testEof = false
        _slen, _trans, _keys, _inds, _acts, _nacts = nil
        _goto_level = 0
        _resume = 10
        _eof_trans = 15
        _again = 20
        _test_eof = 30
        _out = 40
        while true
          if _goto_level <= 0
            if p == pe
              _goto_level = _test_eof
              next
            end
            if cs == 0
              _goto_level = _out
              next
            end
          end
          if _goto_level <= _resume
            _keys = cs << 1
            _inds = _index_offsets[cs]
            _slen = _key_spans[cs]
            _wide = data[p].ord
            _trans = if (_slen > 0 &&
                         _trans_keys[_keys] <= _wide &&
                         _wide <= _trans_keys[_keys + 1])
                       _indicies[_inds + _wide - _trans_keys[_keys]]
                     else
                       _indicies[_inds + _slen]
                     end
            cs = _trans_targs[_trans]
            if _trans_actions[_trans] != 0
              case _trans_actions[_trans]
              when 1
                begin
                  phrase_s = p
                end
              when 13
                begin
                  phrase_lists.phrases << chars(data, phrase_s, p - 1) if phrase_s
                  phrase_s = nil
                end
              when 7
                begin
                end
              when 9
                begin
                end
              when 6
                begin
                end
              when 4
                begin
                end
              when 3
                begin
                  begin
                    stack[top] = cs
                    top += 1
                    cs = 30
                    _goto_level = _again
                    next
                  end
                end
              when 12
                begin
                  begin
                    top -= 1
                    cs = stack[top]
                    _goto_level = _again
                    next
                  end
                end
              when 2
                begin
                  phrase_s = p
                end
                begin
                  begin
                    stack[top] = cs
                    top += 1
                    cs = 30
                    _goto_level = _again
                    next
                  end
                end
              when 14
                begin
                end
                begin
                  phrase_lists.phrases << chars(data, phrase_s, p - 1) if phrase_s
                  phrase_s = nil
                end
              when 8
                begin
                end
                begin
                  begin
                    stack[top] = cs
                    top += 1
                    cs = 30
                    _goto_level = _again
                    next
                  end
                end
              when 10
                begin
                end
                begin
                  begin
                    stack[top] = cs
                    top += 1
                    cs = 30
                    _goto_level = _again
                    next
                  end
                end
              when 11
                begin
                end
                begin
                  begin
                    top -= 1
                    cs = stack[top]
                    _goto_level = _again
                    next
                  end
                end
              when 5
                begin
                end
                begin
                end
              end
            end
          end
          if _goto_level <= _again
            if cs == 0
              _goto_level = _out
              next
            end
            p += 1
            if p != pe
              _goto_level = _resume
              next
            end
          end
          if _goto_level <= _test_eof
            if p == eof
              case _eof_actions[cs]
              when 13
                begin
                  phrase_lists.phrases << chars(data, phrase_s, p - 1) if phrase_s
                  phrase_s = nil
                end
              when 14
                begin
                end
                begin
                  phrase_lists.phrases << chars(data, phrase_s, p - 1) if phrase_s
                  phrase_s = nil
                end
              end
            end
          end
          if _goto_level <= _out
            break
          end
        end
      end

      if p != eof || cs < 42
        raise Mail::Field::IncompleteParseError.new(Mail::PhraseList, data, p)
      end

      phrase_lists
    end
  end
end
