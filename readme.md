# Aviutl_Bezier
Aviutl_BezierはAviutl拡張編集用のベジェ曲線を使ったスクリプト群です。
## 導入方法
[ダウンロードした](https://github.com/kotet/Aviutl_Bezier/archive/master.zip)zipを解凍後、scriptフォルダに使いたいものを入れてください。lib_bezier.lua は必須です。
## 内容
- lib_bezier.lua

  前提ファイル。これより下全てのスクリプトはこのファイルがないと動かない。

- bezier.anm

  N次ベジェ曲線に沿って動かせます。

- bezier_curve.obj

  N次ベジェ曲線が描けます。

- bezier_timing_function.anm

  一番作りたかったやつ。3次ベジェ曲線のX軸を時間、Y軸を進行度に見立ててアニメーションできます。

## 使い方

あとでかく。

bezier-timing-function.anm の[解説動画作った。](http://www.nicovideo.jp/watch/sm25752179)

## 更新履歴

### 2015/03/11

改行がなくなっていた問題を修正。

### 2015/3/12

フォルダ構成によって動作しないことがある問題を修正。

bezier_tools.luaのファイル名をlib_bezier.luaに変更。

少し整理。
