{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "slide"
    }
   },
   "source": [
    "# Support Vector Machine (SVM)\n",
    "\n",
    "- 딥러닝 이전에 분류에서 뛰어난 성능으로 많이 사용되었던 분류 모델\n",
    "- 중간 크기의 데이터셋과 특성이(Feature) 많은 복잡한 데이터셋에서 성능이 좋은 것으로 알려져있다.\n",
    "\n",
    "## 선형(Linear) SVM "
   ]
  },
  {
   "attachments": {},
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "slide"
    }
   },
   "source": [
    "**선 (1)과 (2)중 어떤 선이 최적의 분류 선일까?**\n",
    "\n",
    "![image.png](images/svm_margin0.png)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "slide"
    }
   },
   "source": [
    "(2) 가 최적의 분류를 위한 경계선이다. 이유는 각 클래스의 별로 가장 가까이 있는 데이터간의 거리가 가장 넓기 때문이다. 넓다는 것은 그만큼 겹치는 부분이 적다는 것이므로 새로운 데이터를 예측할 때 모호성이 적어져서 맞을 확률이 더 높아지게 된다. **SVM 모델은 두 클래스 간의 거리를 가장 넓게 분리할 수있는 경계선을 찾는 것을 목표로 한다.**\n",
    "\n",
    "## SVM 목표: support vector간의 가장 넓은 margin을 가지는결정경계를 찾는다.\n",
    "\n",
    "- **Support Vector**\n",
    "    - 양 클래스간에 가장 가까이 있는 값들을 말한다.\n",
    "    - 결정경계 기준으로 양 클래스의 값들 중 결정경계와 가장 가까이 있는 값들이다.\n",
    "- **margin**\n",
    "    - 두 support vector간의 너비\n",
    "- SVM 모델은 최대 마진(margin)을 만드는 결정경계를 찾는다.\n",
    "\n",
    "> ### 결정경계(Decision boundary)란\n",
    "> - 분류 문제에서 클래스들을 구분/분리하는 기준이다.\n",
    "> - 분류 모델들은 학습시 train dataset을 이용해 결정경계를 찾는다."
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "fragment"
    }
   },
   "source": [
    "![image.png](images/svm_margin.png)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "slide"
    }
   },
   "source": [
    "## Hard Margin, Soft Margin\n",
    "\n",
    "- SVM은 데이터 포인트들을 잘 분리하면서 Margin 의 크기를 최대화하는 것이 목적이다. \n",
    "    - Margin의 최대화에 가장 문제가 되는 것이 Outlier(이상치) 들이다. \n",
    "    - Train set의 Outlier들은 Overfitting에 주 원인이 된다.\n",
    "- Margine을 나눌 때 Outlier을 얼마나 무시할 것인지에 따라 Hard margin과 soft margin으로 나뉜다.\n",
    "- **Hard Margin**\n",
    "    - Outlier들을 무시하지 않고 Support Vector를 찾는다. 즉 어떤 데이터 포인트도 결정경계를 침범하지 않도록 한다. 그래서 Support Vector간의 거리(margin)이 매우 좁아 질 수 있다.\n",
    "    - 선형적으로 분리가능할 때는 잘 작동하지만 그렇지 않을 경우 overfitting 문제가 발생할 수 있다.\n",
    "- **Soft Margin**    \n",
    "    - 일부 Outlier들을 무시하고 Support Vector를 찾는다. 즉 일부 데이터 포인트가 결정경계를 침범하여 잘못 분류되는 것을 허용한다. 그래서 Support Vector간의 거리(margin)을 넓힐 수있다.\n",
    "    - 무시 비율을 하이퍼파라미터 `C`로 정한다. 무시비율이 너무 커지면 underfitting 문제가 발생할 수 있다."
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "![image.png](images/svm_c.png)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "slide"
    }
   },
   "source": [
    "### Hard/Soft margin 설정 하이퍼파라미터 C\n",
    "- SVM의 규제 하이퍼파라미터.\n",
    "- 잘못 분류 되는 것을 허용하는 비율 설정 하이퍼파라미터.\n",
    "- 노이즈가 있는 데이터나 선형적으로 분리 되지 않는 경우 **C값을** 조정해 마진을 변경한다.\n",
    "- 기본값 1\n",
    "- 값이 클 수록 무시비율을 낮게 해서 규제를 약하게 한다. 너무 크게 설정 하면 overfitting이 일어날 수 있다.\n",
    "- 작을 수록 무시비율을 높여 규제를 강하게 한다. 너무 작게 설정 할 경우 underfitting이 일어날 수 있다.\n",
    "- **Overfitting이 발생하면 값을 작게, Underfitting이 발생하면 크게 조정한다.**"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "slide"
    }
   },
   "source": [
    "## Kernel SVM (비선형(Non Linear) SVM)\n",
    "### 비선형데이터 셋에 SVM 적용\n",
    "- 선형으로 분리가 안되는 경우는?\n",
    " \n",
    "![image.png](images/kernel_svm1.png)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "fragment"
    }
   },
   "source": [
    "- 다항식 특성을 추가하여 차원을 늘려 선형 분리가 되도록 변환\n",
    "  \n",
    "![image.png](images/kernel_svm2.png)\n",
    "\n",
    "[2차원으로 변환 $x_3=x_1^2$ 항 추가]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "fragment"
    }
   },
   "source": [
    "![image.png](images/kernel_svm3.png)\n",
    "\n",
    "[원래 공간으로 변환]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "fragment"
    }
   },
   "source": [
    "참고: https://www.youtube.com/watch?v=3liCbRZPrZA&t=42s"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "fragment"
    }
   },
   "source": [
    "### Kernel trick(커널 트릭)\n",
    "- 비선형 데이터셋을 선형으로 분리하기 위해 차원을 변경해야 하는데 이때 사용하는 함수를 **Kernel**이라고 하고 차원을 변경하는 것을 **kernel trick** 이라고 한다.\n",
    "    - 대표적인 kernel함수 \n",
    "        - **Radial kernel**\n",
    "        - Polynomial kernel\n",
    "        - Sigmoid kernel"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "slide"
    }
   },
   "source": [
    "### Non linear SVM 모델의 하이퍼파라미터\n",
    "- C\n",
    "    - Softmargin과 hard margin 적용 값\n",
    "- gamma\n",
    "    - 비선형 결정정계를 얼마나 유연하게 만들 지 조절하는 규제 하이퍼파라미터.\n",
    "        - Linear SVM의 경우 gamma 값의 영향을 받지 않는다.\n",
    "    - **개별 데이터포인트가 결정 경계를 만드는데 어느 정도 영향력을 주는지를 설정하는 값** \n",
    "        - 값을 크게 하면 개별 데이터 포인트의 결정 경계의 굴곡에 대해 영향을 미치는 범위가 작아진다. 그래서 결정 경계가 데이터 포인트 주변으로 좁혀지게 되어 이상치에 민감해져 overfitting이 발생할 수 있다. \n",
    "        - 값을 작게 하면 개별 데이터 포인트의 결정 경계의 굴곡에 대해 영향을 미치는 범위가 넓어져 넓은 결정 경계를 만들고 개별 데이터 포인트에 민감하게 반응하지 않는다. 그래서 너무 작게 하면 underfitting이 발생 할 수 있다.\n",
    "    - **Overfitting이 발생하면 값을 작게, Underfitting이 발생하면 크게 조정한다.**\n",
    "\n",
    "#### gamma 값에 따른 결정경계 형태\n",
    "![gamma](images/svm_gamma.png)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## SVM 모델링\n",
    "- 데이터 전처리\n",
    "    - 연속형(수치형) - Feature scaling\n",
    "    - 범주형 - One Hot Encoding"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.datasets import load_breast_cancer\n",
    "from sklearn.model_selection import train_test_split\n",
    "\n",
    "X, y = load_breast_cancer(return_X_y=True)\n",
    "X_train, X_test, y_train, y_test = train_test_split(X, y, stratify=y, random_state=1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.preprocessing import StandardScaler\n",
    "scaler = StandardScaler()\n",
    "X_train_scaled = scaler.fit_transform(X_train)\n",
    "X_test_scaled = scaler.transform(X_test)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### 규제 파라미터 변화에 따른 성능 변화"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# SVR: 회귀, SVC: 분류\n",
    "from sklearn.svm import SVC\n",
    "from sklearn.metrics import accuracy_score\n",
    "\n",
    "# Linear SVM - 규제 hyper parameter: C\n",
    "## 작을 수록 규제 강도가 큼.\n",
    "C_list = [0.001, 0.01, 0.1, 1, 10, 100] # 0 초과의 값을 지정. 실수. default: 1\n",
    "train_acc_list = []\n",
    "test_acc_list = []\n",
    "\n",
    "for C in C_list:\n",
    "    svm = SVC(\n",
    "        kernel=\"linear\", # 커널 함수 지정. 선형SVM: linear, 비선형SVM: rbf(기본), poly, sigmoid\n",
    "        C=C,             # soft - hard margin 설정. (작을수록 강한 규제)\n",
    "        random_state=0\n",
    "    )\n",
    "    # 학습\n",
    "    svm.fit(X_train_scaled, y_train)\n",
    "    # 검증\n",
    "    ## 추론\n",
    "    pred_train = svm.predict(X_train_scaled)\n",
    "    pred_test = svm.predict(X_test_scaled)\n",
    "    ## 평가\n",
    "    train_acc_list.append(accuracy_score(y_train, pred_train))\n",
    "    test_acc_list.append(accuracy_score(y_test, pred_test))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "import pandas as pd\n",
    "import numpy as np\n",
    "df = pd.DataFrame({\n",
    "    \"C\":np.log10(C_list),\n",
    "    # \"C\": C_list,\n",
    "    \"Train\": train_acc_list,\n",
    "    \"Test\": test_acc_list\n",
    "})\n",
    "df.set_index(\"C\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "df.set_index(\"C\").plot();"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "###############################################################################\n",
    "# 비선형 SVM. Hyper Parameter - C: soft/hard margin 규제, gamma (기본: 1)\n",
    "#\n",
    "# gamma  변경에 따른 성능 변화.\n",
    "###############################################################################\n",
    "gamma_list = [0.001, 0.01, 0.1, 1, 5, 10, 100]\n",
    "train_acc_list = []\n",
    "test_acc_list = []\n",
    "for gamma in gamma_list:\n",
    "    svm = SVC(kernel=\"rbf\", C=1, gamma=gamma)  # kernel기본값: rbf\n",
    "    svm.fit(X_train_scaled, y_train)\n",
    "    train_acc_list.append(accuracy_score(y_train, svm.predict(X_train_scaled)))\n",
    "    test_acc_list.append(accuracy_score(y_test, svm.predict(X_test_scaled)))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "df = pd.DataFrame({\n",
    "    \"gamma\":np.log10(gamma_list),\n",
    "    \"Train\":train_acc_list,\n",
    "    \"Test\":test_acc_list\n",
    "})\n",
    "df"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "df.set_index(\"gamma\").plot(grid=True);"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "slide"
    }
   },
   "source": [
    "##### ROC AUC score, AP score "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.metrics import roc_auc_score, average_precision_score\n",
    "\n",
    "# probability=True 설정해야 predict_proba() 사용가능.\n",
    "svm = SVC(probability=True) \n",
    "svm.fit(X_train_scaled, y_train)\n",
    "pos_proba = svm.predict_proba(X_train_scaled)[:, 1]\n",
    "print(roc_auc_score(y_train, pos_proba))\n",
    "print(average_precision_score(y_train, pos_proba))"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "slide"
    }
   },
   "source": [
    "## GridSearch로 최적의 조합찾기"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "slideshow": {
     "slide_type": "fragment"
    }
   },
   "source": [
    "##### GridSearchCV 생성 및 학습\n",
    "- LinearSVC: C\n",
    "- RBF SVC: C, gamma"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.datasets import load_breast_cancer\n",
    "from sklearn.model_selection import train_test_split\n",
    "X, y = load_breast_cancer(return_X_y=True)\n",
    "\n",
    "X_train, X_test, y_train, y_test = train_test_split(X, y, stratify=y, random_state=1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.preprocessing import StandardScaler\n",
    "from sklearn.svm import SVC\n",
    "from sklearn.pipeline import Pipeline\n",
    "from sklearn.model_selection import GridSearchCV\n",
    "\n",
    "# SVM : Feature scaling/One Hot Encoding 전처리.\n",
    "pipeline = Pipeline([\n",
    "    (\"scaler\", StandardScaler()), \n",
    "    (\"svm\", SVC(random_state=0, probability=True))\n",
    "])\n",
    "\n",
    "params = {\n",
    "    \"svm__kernel\": [\"linear\", \"rbf\",  \"poly\", \"sigmoid\"],\n",
    "    \"svm__C\": [0.01, 0.1, 1, 10, 100], \n",
    "    \"svm__gamma\": [0.01, 0.1, 1, 10, 100], \n",
    "}\n",
    "\n",
    "gs = GridSearchCV(\n",
    "    pipeline, \n",
    "    params,\n",
    "    scoring=[\"accuracy\", \"roc_auc\", \"average_precision\"], \n",
    "    refit=\"accuracy\",\n",
    "    cv=4,\n",
    "    n_jobs=-1\n",
    ")\n",
    "gs.fit(X_train, y_train)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "gs.best_score_"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "gs.best_params_"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "scrolled": true
   },
   "outputs": [],
   "source": [
    "gs.best_estimator_"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "pd.DataFrame(gs.cv_results_).sort_values(\"rank_test_accuracy\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.12.7"
  },
  "toc": {
   "base_numbering": 1,
   "nav_menu": {},
   "number_sections": false,
   "sideBar": true,
   "skip_h1_title": false,
   "title_cell": "Table of Contents",
   "title_sidebar": "Contents",
   "toc_cell": false,
   "toc_position": {},
   "toc_section_display": true,
   "toc_window_display": false
  },
  "varInspector": {
   "cols": {
    "lenName": 16,
    "lenType": 16,
    "lenVar": 40
   },
   "kernels_config": {
    "python": {
     "delete_cmd_postfix": "",
     "delete_cmd_prefix": "del ",
     "library": "var_list.py",
     "varRefreshCmd": "print(var_dic_list())"
    },
    "r": {
     "delete_cmd_postfix": ") ",
     "delete_cmd_prefix": "rm(",
     "library": "var_list.r",
     "varRefreshCmd": "cat(var_dic_list()) "
    }
   },
   "types_to_exclude": [
    "module",
    "function",
    "builtin_function_or_method",
    "instance",
    "_Feature"
   ],
   "window_display": false
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
