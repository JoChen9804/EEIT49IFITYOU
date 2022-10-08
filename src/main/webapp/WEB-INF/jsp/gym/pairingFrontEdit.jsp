<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>配對中心</title>
</head>
<body>
<%@include file="../admin/FrontStageHead.jsp" %>
<div id="features" class="tabs">
        <div class="container">
            <div class="row" style="padding:10px">
                <div class="col-lg-12">
                    <div class="above-heading">I FIT YOU</div>
                    <h2 class="h2-heading">配對資料修改</h2>
                    <p class="p-heading">尋找最適合你的</p>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
            <div class="row">
                <div class="col-lg-12">

                    <!-- Tabs Links -->
                    <ul class="nav nav-tabs" id="argoTabs" role="tablist" style="padding-bottom:0px">
                        <li class="nav-item">
                            <a class="nav-link active" id="nav-tab-1" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true"><i class="fas fa-list"></i>關於我</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="nav-tab-2" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false"><i class="fas fa-envelope-open-text"></i>篩選資料</a>
                        </li>
                    </ul>
                    <!-- end of tabs links -->

                    <!-- Tabs Content -->
                    <div class="tab-content" id="argoTabsContent">

                        <!-- Tab -->
                        <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="tab-1">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="text-container">
                                    <!-- Newsletter Form -->
				                        <div id="newsletterForm" data-toggle="validator" data-focus="false">
				                            <div class="form-group">
				                            	<input class="form-control-input" list="datalistOptions" id="clocate" required>
				                                <label class="label-control" for="clocate">出沒地區</label>
				                            	<datalist id="datalistOptions">
					                                <option class="select-option" value="基隆市"></option>
					                                <option class="select-option" value="臺北市"></option>
					                                <option class="select-option" value="新北市"></option>
					                                <option class="select-option" value="桃園市"></option>
					                                <option class="select-option" value="新竹市／新竹縣"></option>
					                                <option class="select-option" value="苗栗縣"></option>
					                                <option class="select-option" value="臺中市"></option>
					                                <option class="select-option" value="彰化縣"></option>
					                                <option class="select-option" value="南投縣"></option>
					                                <option class="select-option" value="雲林縣"></option>
					                                <option class="select-option" value="嘉義市／嘉義縣"></option>
					                                <option class="select-option" value="臺南市"></option>
					                                <option class="select-option" value="高雄市"></option>
					                                <option class="select-option" value="屏東縣"></option>
					                                <option class="select-option" value="宜蘭縣"></option>
					                                <option class="select-option" value="花蓮縣"></option>
					                                <option class="select-option" value="臺東縣"></option>
					                                <option class="select-option" value="澎湖縣"></option>
					                                <option class="select-option" value="金門縣"></option>
					                                <option class="select-option" value="連江縣"></option>
				                                </datalist>
				                                <div style="margin:10px;">
				                                	<p class="p-small" id="showLocText"></p>
				                                	<button class="btn-outline-reg" id="addLoc">新增地區</button>
				                                	<button class="btn-outline-red" id="resetloc">重設地區</button>
				                                </div>
				                                <div class="p-small" id="locError"></div>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                            	<select class="form-control-select" id="workoutTime" required>
					                                <option class="select-option" value="" disabled selected>請選擇最常運動的時段</option>
					                                <option class="select-option" value="1">02:01-10:00</option>
					                                <option class="select-option" value="2">10:01-18:00</option>
					                                <option class="select-option" value="3">18:01-02:00</option>
				                                </select>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                            	<select class="form-control-select" id="workoutFrequency" required>
					                                <option class="select-option" value="" disabled selected>請選擇運動頻率</option>
					                                <option class="select-option" value="0">一週少於1天</option>
					                                <option class="select-option" value="1">一週1天</option>
					                                <option class="select-option" value="2">一週2天</option>
					                                <option class="select-option" value="3">一週3天</option>
					                                <option class="select-option" value="4">一週4天</option>
					                                <option class="select-option" value="5">一週5天</option>
					                                <option class="select-option" value="6">一週6天</option>
					                                <option class="select-option" value="7">一週7天</option>
				                                </select>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                            	<select class="form-control-select" id="workoutType" required>
					                                <option class="select-option" value="" disabled selected>請選擇偏好的運動種類</option>
					                                <option class="select-option" value="1">徒手健身／街頭健身</option>
					                                <option class="select-option" value="2">自由重量</option>
					                                <option class="select-option" value="3">機械式</option>
					                                <option class="select-option" value="4">其他無氧運動</option>
					                                <option class="select-option" value="5">室內有氧（跑步機、踏步機等）</option>
					                                <option class="select-option" value="6">瑜珈、皮拉提斯等</option>
					                                <option class="select-option" value="7">其他有氧運動</option>
				                                </select>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                            	<select class="form-control-select" id="relationship" required>
					                                <option class="select-option" value="" disabled selected>請選擇目前的感情狀態</option>
					                                <option class="select-option" value="1">單身</option>
					                                <option class="select-option" value="3">非單身</option>
					                                <option class="select-option" value="2">其他</option>
				                                </select>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                                <textarea class="form-control-input" id="connection" style="height: 100px" required></textarea>
				                                <label class="label-control" for="connection">聯繫方式</label>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                                <textarea class="form-control-input" id="toPartner" style="height: 150px" required></textarea>
				                                <label class="label-control" for="toPartner">給健友的話</label>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group checkbox">
				                                <input type="checkbox" id="nterms" value="Agreed-to-Terms" required>勾選表示已閱讀並同意<a href="privacy-policy.html">隱私及使用條款</a> 
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-message">
				                                <div class="h3 text-center hidden" id="vforAll"></div>
				                            </div>
				                            <div class="form-group">
				                                <button type="button" class="form-control-submit-button" id="subMePair">申請配對</button>
				                            </div>
				                        </div>
				                        <!-- end of newsletter form -->
				                        <form action="/group5/user/pairing/whofitme" method="post" id="submit01"><input type="hidden" name="pdid" id="subid"></form>
                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->

                        <!-- Tab -->
                        <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="tab-2">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="text-container">
                                    <!-- Newsletter Form -->
				                        <div id="newsletterForm" data-toggle="validator" data-focus="false">
				                            <div class="form-group" style="font-size:0.8em">
				                            	<span >尋找性別：</span>
				                            	<div class="form-check form-check-inline">
						                            <input class="form-check-input" type="radio" name="gender" id="gender2" value="2">
													<label class="form-check-label" for="gender2">不拘</label>
					                            </div>
					                            <div class="form-check form-check-inline">
					                            	<input class="form-check-input" type="radio" name="gender" id="gender1" value="1">
													<label class="form-check-label" for="gender1">男性</label>
					                            </div>
					                            <div class="form-check form-check-inline">
					                            	<input class="form-check-input" type="radio" name="gender" id="gender3" value="3">
													<label class="form-check-label" for="gender3">女性</label>
				                                </div>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                            	<select class="form-control-select" id="relationship" required>
					                                <option class="select-option" value="" disabled selected>請選擇希望對方的感情狀態</option>
					                                <option class="select-option" value="1">單身</option>
					                                <option class="select-option" value="3">非單身</option>
					                                <option class="select-option" value="2">不拘</option>
				                                </select>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-message">
				                                <div class="h3 text-center hidden" id="vforAll"></div>
				                            </div>
				                            <div class="form-group">
				                                <button type="button" class="form-control-submit-button" id="subMePair">開始配對</button>
				                            </div>
				                        </div>
				                        <!-- end of newsletter form -->
										<form action="/group5/user/pairing/start2pair" method="post" id="start2pair"><input type="hidden" name="mainPid" id="mainPid"></form>
                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->
                        
                    </div> <!-- end of tab content -->
                    <!-- end of tabs content -->

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of tabs -->
    <!-- end of features -->

<%@include file="../admin/FrontStageFoot.jsp" %>
</body>
</html>