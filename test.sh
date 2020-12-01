FILE2="cut.py"

if [ ! -e $FILE2 ]; then
  touch cut.py
  echo "import cv2
import sys
  
args = sys.argv

img = cv2.imread("{}".format(str(args[5])))
left, right = int(args[1]), int(args[3])
top, bottom = int(args[2]), int(args[4])
im2 = img[top:bottom, left:right]
cv2.imwrite("{}.jpg".format(str(args[6])), im2)" >> cut.py
else
  echo "starting..."
  echo ""
fi

echo "Make the type you want to classify into a directory with a name."
echo ""
echo "person/bicycle/car/motorcycle/airplane/bus/train/truck/boat/traffic light/fire hydrant/stop sign/parking meter/bench/bird/cat/dog/horse/sheep/cow/elephant/bear/zebra/giraffe/backpack/umbrella/handbag/tie/suitcase/frisbee/skis/snowboard/sports ball/kite/baseball bat/baseball glove/skateboard/surfboard/tennis racket/bottle/wine glass/cup/fork/knife/spoon/bowl/banana/apple/sandwich/orange/broccoli/carrot/hot dog/pizza/donut/cake/chair/couch/potted plant/bed/dining table/toilet/tv/laptop/mouse/remote/keyboard/cell phone/microwave/oven/toaster/sink/refrigerator/book/clock/vase/scissors/teddy bear/hair drier/toothbrush"
echo ""

read -p "file name? >" str
mkdir "${str}Result"
count=1

source myvenv/bin/activate

for txt in $(ls $str); do
  ./darknet detect cfg/yolov3.cfg yolov3.weights ${str}/${txt} >> result.txt
  cat result.txt | awk "/$str:/,/Bottom/" >> result2.txt
  cat result2.txt | tr ',' '\n' | sed -e 's/\n/,$/g' >> result3.txt
  cat result3.txt | tr -cd '0123456789\n' >> result4.txt
  tail -n 4 result4.txt >> result5.txt
  cat result5.txt | tr '\n' ' ' >> result6.txt
  
  python3 cut.py `cat result6.txt` ${str}/${txt} ${str}Result/${count}
  count=`expr $count + 1`
  rm result.txt result2.txt result3.txt result4.txt result5.txt result6.txt
done



#./darknet detect cfg/yolov3.cfg yolov3.weights dog/download.jpg >> result.txt
#cat result.txt | awk '/dog:/,/Bottom/' >> result2.txt
#cat result2.txt | tr ',' '\n' | sed -e 's/\n/,$/g' >> result3.txt
#cat result3.txt | tr -cd '0123456789\n' >> result4.txt
#tail -n 4 result4.txt >> result5.txt
#cat result5.txt | tr '\n' ' ' >> result6.txt
#python cut.py `cat result6.txt` "aaa"
