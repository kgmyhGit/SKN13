
###### 평가 모듈 -> 다양한 평가지표들을 계산/출력하는 함수들가지는 모듈
import matplotlib.pyplot as plt
from sklearn.metrics import (confusion_matrix, ConfusionMatrixDisplay, 
                             recall_score, precision_score, f1_score, accuracy_score,
                             PrecisionRecallDisplay, average_precision_score, precision_recall_curve,
                             RocCurveDisplay, roc_auc_score, roc_curve,
                             mean_squared_error, root_mean_squared_error, r2_score)

__version__ = 1.2

def plot_precision_recall_curve(y_proba, pred_proba, estimator_name=None, title=None):
    """Precision Recall Curve 시각화 함수
    Args:
        y_proba: ndarray - 정답
        pred_proba: 모델이 추정한 양성(Positive-1)일 확률
        estimator_name: str - 모델 이름. 시각화시 범례에 출력할 모델이름
        title: str - plot 제목
    Returns:
    Raises:"""
    # ap score 계산
    ap_score = average_precision_score(y_proba, pred_proba)
    # thresh 변화에 따른 precision, recall 값들 계산.
    precision, recall, _ = precision_recall_curve(y_proba, pred_proba)
    # 시각화
    disp = PrecisionRecallDisplay(
        precision, recall, 
        average_precision=ap_score,  
        estimator_name=estimator_name
    )
    disp.plot()
    if title:
        plt.title(title)
    plt.show()

def plot_roc_curve(y_proba, pred_proba, estimator_name=None, title=None):
    """ROC Curve 시각화
    Args:
        y_proba: ndarray - 정답
        pred_proba: 모델이 추정한 양성(Positive-1)일 확률
        estimator_name: str - 모델 이름. 시각화시 범례에 출력할 모델이름
        title: str - plot 제목
    Returns:
    Raises:"""
    ## ROC-AUC score 계산
    auc_score = roc_auc_score(y_proba, pred_proba)
    ## Thresh 변화에 따른 TPR(Recall) 과 FPR(위양성율) 계산
    fpr, tpr, _ = roc_curve(y_proba, pred_proba)
    ### 시각화
    disp = RocCurveDisplay(
        fpr=fpr, tpr=tpr, 
        estimator_name=estimator_name,
        roc_auc=auc_score
    )
    disp.plot()
    if title:
        plt.title(title)
    plt.show()

def plot_confusion_matrix(y, pred, title=None):
    """Confusion matrix 시각화 함수
    Args:
        y: ndarray - 정답
        pred: ndarray - 모델 추정결과
        title: str - 출력할 제목. default=None
    Returns:
    Raises::
    """
    cm = confusion_matrix(y, pred)
    disp = ConfusionMatrixDisplay(cm)
    disp.plot(cmap="Blues")
    if title:
        plt.title(title)
    plt.show()

def print_binary_classification_metrics(y, pred, proba=None, title=None):
    """정확도, 재현율, 정밀도, f1 점수를 계산해서 출력하는 함수
    만약 모델이 추정한 양성의 확률을 전달 받은 경우 average_precision과  roc-auc score도 출력
    Args:
        y: ndarray - 정답
        pred: ndarray - 모델 추정결과
        proba: ndarray - 모델이 추정한 양성일 확률값. Default: None
        title: str - 결과에 대한 제목 default=None
    Return
    Exception
    """
    if title:
        print(title)
    print("정확도:", accuracy_score(y, pred))
    print("재현율:", recall_score(y, pred))
    print("정밀도:", precision_score(y, pred))
    print("F1 점수:", f1_score(y, pred))
    if proba is not None:
        print("Average Precision:", average_precision_score(y, proba))
        print("ROC-AUC Score:", roc_auc_score(y, proba))

def print_regression_metrcis(y, pred, title=None):
    """회귀 평가지표를 출력하는 함수
    Args:
        y: ndarray - 정답 
        pred: ndarray - 모델 추정값
        title: 결과에 대한 제목. default: None
    Returns:
    Raises:"""
    if title:
        print(title)
    print("MSE:", mean_squared_error(y, pred))
    print("RMSE:", root_mean_squared_error(y, pred))
    print("R Squared:", r2_score(y, pred))
