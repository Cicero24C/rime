-- #############
-- translators #
-- #############

---------------
-- 本文件中的日期代码来自网友“镜中的迷离”
-- 深山红叶合成整理

-- 输入日期时间
function date_translator(input, seg)
    if (input == "date" or input == "dt" or input == "rq" ) then
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), " "))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), " "))
    end

    if (input == "time") then
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), " "))
        yield(Candidate("time", seg.start, seg._end, os.date("%H点%M分"), " "))
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " "))
        yield(Candidate("time", seg.start, seg._end, os.date("%H点%M分%S秒"), " "))
    end

    if (input == "dttm") then
        yield(Candidate("time", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), " "))
    end
end

-- number_translator: 将 `U` + 阿拉伯数字 翻译为大小写汉字
-- 详见 `lua/number.lua`
number_translator = require("number")

-- 设定非单字候选项个数
-- limit_multi_char_word_filter = require("limit_multi_char_word")

-- #########
-- filters #
-- #########

-- select_character_processor: 以词定字
-- 详见 `lua/select_character.lua`
select_character_processor = require("select_character")

-- charset_filter: 滤除含 CJK 扩展汉字的候选项
-- charset_comment_filter: 为候选项加上其所属字符集的注释
-- 详见 `lua/charset.lua`
local charset = require("charset")
charset_filter = charset.filter
charset_comment_filter = charset.comment_filter

--- 单字在先
function single_char_first_filter(input)
   local l = {}
   for cand in input:iter() do
      if (utf8.len(cand.text) == 1) then
         yield(cand)
      else
         table.insert(l, cand)
      end
   end
   for i, cand in ipairs(l) do
      yield(cand)
   end
end
