# yolov3 automation for linux
このプロジェクトはYolov3で学習した画像をPython(Open CV)で切り取り、新しいディレクトリーに保存する作業をLinuxシェルスクリプトで自動化させるものである。環境構築は個人に合わせて行ってください。

# Dependency
Yolov3
Linux 
Python3(Open CV)

# Setup
```
python3 -m venv myvenv
source myvenv/vin/activate
pip install -r requirements.txt

chmod 744 tesh.sh
```
# Usage
事前準備
1. $ git clone https://github.com/pjreddie/darknet
2. $ cd darknet
3. $ make
4. $ wget https://pjreddie.com/media/files/yolov3.weights

1. darknetにtest.shとrequirements.txtファイルを移動させる。 
2. Setupで通りに環境構築をする。
3. ディレクトリー名と物体検出をしたい対象の名前を一緒にする。(＊１から名前を参考)
4. 画像ディレクトリーをdarknetに移動させる。
5. $ ./test.sh
6. ディレクトリー名を読み込む
DONE

＊１(学習が可能なカテゴリー)
{person/bicycle/car/motorcycle/airplane/bus/train/truck/boat/traffic light/fire hydrant/stop sign/parking meter/bench/bird/cat/dog/horse/sheep/cow/elephant/bear/zebra/giraffe/backpack/umbrella/handbag/tie/suitcase/frisbee/skis/snowboard/sports ball/kite/baseball bat/baseball glove/skateboard/surfboard/tennis racket/bottle/wine glass/cup/fork/knife/spoon/bowl/banana/apple/sandwich/orange/broccoli/carrot/hot dog/pizza/donut/cake/chair/couch/potted plant/bed/dining table/toilet/tv/laptop/mouse/remote/keyboard/cell phone/microwave/oven/toaster/sink/refrigerator/book/clock/vase/scissors/teddy bear/hair drier/toothbrush}

# License
None

# Authors
tim0114gap
