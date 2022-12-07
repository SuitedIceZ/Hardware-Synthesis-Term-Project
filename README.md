# Hardware-Synthesis-Term-Project



# TODO list 
inorder maybe?
## input module?
- UART module by Serial interface 
    - (4 digits of decimal operation) 
    - [CHECK] ได้ข้อมูล byte แล้ว (done without tested)
- Reset switch
    - [CHECK] รับข้อมูลจาก switch แล้ว (done without tested)

## utils module?
- debouncer
- single pulser
- D-flipflop

## calculate module?
- Memory System (4 digits of decimal operation)
    - inputController module
        - [CHECK] ได้ reg ของเลข A,B ใน two complement แล้ว (done without tested)

- ALU (plus, minus, multiplication, division)

## output module?
- VGA display
(640*480?, Display 4 digits, show "NaN" for over and under flow)
    - VGA system module
        - [CHECK] ได้ reg mem internal ขนาด 640*480 แล้ว
        - [CHECK] initial bar แล้ว (done without tested)
        - [CHECK] เพิ่ม mem เก็บ position และ size แล้ว (done without tested)
        - assign แต่ละตำแหน่งไปยัง dynamic mem  ที่เปลี่ยนไปตามแต่ละตัวที่โหลดมาได้
- numConverter
    - convert two complement number to display

## controller module?
- Assembly code to control all the system (คิดว่าไม่จำเป็น)
- Top-most module?

# Note



## ตำแหน่ง display

ตำแหน่ง (ซ้ายบน) 
แถวแรก: y= 75 | x= 80, 164, 248, 332, 416
แถวสอง: y= 183 | x เหมือนเดิม 
เครื่องหมาย: y= 183 | x= 500
เส้นคั่นระหว่าง input & output: y= 291 | x= 80 
แถวสาม: y= 311 | x เหมือนเดิม 

## ขนาด display

ขนาด (y= แนวตั้ง | x= แนวนอน)
ตัวเลข & ตัวอักษร: y= 96 | x= 60
เครื่องหมาย: y= 60 | x= 60
เส้นคั่นระหว่าง input & output: y= 8 | x= 396

## คำสั่งอ่าน mem
    $readmemb(FILE_PATH, mem, right ,left); //b,d,h
    // use full file path and "/" instead of "\"
    // work on : [word_size-1:0] mem [left:right]
    // Each row of FILE_PATH = size of mem word
    // FILE_PATH have {left}+1 row

## overall design
https://www.figma.com/file/ttdMgiPqOm3iubzaCuELEg/Untitled?node-id=0%3A1&t=1q9XEZVmiG1E8r37-1

## memory generator
https://colab.research.google.com/drive/1w_Xdy1zjZwN9j4Df6NwWMuRBn8sb7eZn?usp=sharing