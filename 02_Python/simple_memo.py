
print("==========CLI 메모장============")
file_path = input("저장할 파일경로:")
with open(file_path, "wt", encoding="utf-8") as fw:
    print("==========저장할 내용을 한줄씩 입력하세요.===========")
    while True:
        txt = input(">>")
        if txt == '!q':
            break
        fw.write(txt+"\n")

print("===========저장되었습니다.===========")
