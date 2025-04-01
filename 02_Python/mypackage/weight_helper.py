# %load mypackage/weight_helper.py
# %%writefile 파일경로 -> cell의 작성한 내용을 경로의 파일에 작성(저장.) -> cell의 첫줄에 넣어야함.
def check_bmi(tall, weight):
    return weight/tall**2
