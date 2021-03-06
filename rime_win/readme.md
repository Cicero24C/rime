# 各方案介绍

**注意：以下说明已过时，还没有改过来，具体以配置文件为准。**

## 方案列表

1. msdpy：
2. wubi98_single
3. wubi98
4. numbers

其余一些scheme文件为以上主要输入方案的辅助文件，包括反查、英文输入等。以上方案详细介绍如下。

## msdpy

微软双拼方案，包含特性：

* **词库**：`mygeneral.dict.yaml`，合并多处不同来源的词库，基本覆盖搜狗各分类下的主要词库，其中单字分割出来单独写为`single.dict.yaml`

* 单字通过`fzm`实现自然码辅助码输入
* 通过`engl`实现英文输入（中英混输）
* 以词定字（左右[]）
* 反查方案两种：
  * liangfen：以「`」引导
  * 笔画：以「o`」引导
* 「\fh」输入特殊符号
* 时间、日期输入：以「date/dt」、「time」引导
* 简繁切换
* 数字转大写：以「U」引导
* emoji输入（默认关闭，可通过切换菜单打开）
* 默认CJK字符集，借助`lua_filter@charset_filter`过滤生僻字

## wubi98_single

五笔单字输入方案：

* 仅能输入单字
* **词库**：`wubi98_single.dict.yaml`，来自rime官方，另有`wubi98_single_U.dict.yaml`超大字符集（源自「98五笔资源库」）备用
* 默认字符集：gbk，可切换：gb2312，utf-8
* 反查方案：
  - fzm：以「z」引导
* 「\fh」输入特殊符号
* 时间、日期输入：以「date」、「time」引导
* 简入繁出
* 数字转大写：以「U」引导

## wubi98

五笔输入方案：

* 可输入词组、句子
* **词库**：源自「98五笔资源库」的`wubi98_ci.dict.yaml`
* 默认字符集：全字符集，可切换：gb2312
* 精准造词：以「`」引导
* 时间、日期输入：以「date」、「time」引导
* 数字转大写：以「U」引导
