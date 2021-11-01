<!--#include virtual="/common/inc/config.asp"-->
<!--#include file="./fnc.asp"-->
<%
Response.ChaRset = "UTF-8"

'-----------------------------------------------------------------------
' 업 무 명 : 시대인재 - 재종 - 입시 R&D - 가채점 상담신청
' 모듈기능 : 상담신청 입력
' 파 일 명 : apply.asp
' 작성일자 : 2018/11/01
' 작 성 자 : 배지은
'-----------------------------------------------------------------------
' 변경일자   변경자  변동내역
'-----------------------------------------------------------------------
'
'-----------------------------------------------------------------------


'------------------------------
' page navi code
'------------------------------
pg_menu_code = "224"

'------------------------------
' VARS
'------------------------------
authHP  = fncRequestForm("authHP")       ' 휴대폰 번호
authNm	= fncRequestForm("authNm")       ' 이름


'If COOK_ID = "baejieun" Or COOK_ID="govo5110" OR COOK_ID="nnlee1" OR COOK_ID="kokiorea" Or COOK_ID="guessong" Or COOK_ID="kimseulgi" Then
'	authHP = "010-7127-1703"
'	authNm ="고동훈"
'	mst_seq = 1
'End If



' 이름, 휴대폰 번호 필수 입력
If authHP = "" Or authNm = ""  Then
	Call jsmsgLink("잘못된 경로로 접근하셨습니다.", "./default.asp","")
	Response.End 

End If

OPEN_FLG = 1 '///실제적용 시 OPEN_FLG = 0
EDIT_END_FLG = 0

'If CDbl(Replace(Date,"-","") & Replace(FormatDateTime(Now(), 4),":","")) >= 201911151000 Then
'	OPEN_FLG = 1
'End If
'
'If COOK_ID = "rndanswer" Then 
'    If CDbl(Replace(Date,"-","") & Replace(FormatDateTime(Now(), 4),":","")) >= 201912040001 Then
'        EDIT_END_FLG = 1
'    End If
'Else 
'    If CDbl(Replace(Date,"-","") & Replace(FormatDateTime(Now(), 4),":","")) >= 201911300001 Then
'        EDIT_END_FLG = 1
'    End If
'End If 
'
'If OPEN_FLG = 0 Then
'	Call jsmsgLink("상담 신청 준비중입니다. 감사합니다.", "./default.asp","")
'	Response.End 
'End If

'------------------------------
' QUERY
'------------------------------

arrParams = Array( _
    DbCon.makeParam("@PAGE", adInteger, adParamInput, 4, "1"), _
    DbCon.makeParam("@PAGE_RECORD", adInteger, adParamInput, 4, "1"), _
    DbCon.makeParam("@PAGING_FLAG", adChar, adParamInput, 1, "N"), _
    DbCon.makeParam("@SCH_MST_SEQ", adInteger, adParamInput, 4, MST_SEQ), _
    DbCon.makeParam("@SCH_CLASS_KBN", adChar, adParamInput, 1, ""), _
    DbCon.makeParam("@SCH_REP_STAT", adChar, adParamInput, 1, ""), _
    DbCon.makeParam("@SCH_COUS_CSTT", adInteger, adParamInput, 4, ""), _
    DbCon.makeParam("@SCH_GUBUN", adVarchar, adParamInput, 20, "ALL"), _
    DbCon.makeParam("@SCH_TEXT", adVarchar, adParamInput, 100, authNm&"|"&authHP), _
    DbCon.makeParam("@SCH_DTL_SEQ", adInteger, adParamInput, 4, "") _
)

vList = DbCon.ExecRsList("P_COUS_GRD_DTL_LIST", adCmdStoredProc, arrParams, vListCnt, Nothing)

iMode = "I"

CGD_SUSI_VIEW = 1


If IsArray(vList) Then

	TOTAL_CNT           = vList(0,0)
	CGD_DTL_SEQ			= vList(1,0)
	CGD_MST_SEQ			= vList(2,0)
	CGD_USER_NM			= vList(3,0)
	CGD_USER_HP			= vList(4,0)
	CGD_SMS_YN			= vList(5,0)
	CGD_CLASS_KBN		= vList(6,0)
	CGD_HIS_SCR			= vList(7,0)
	CGD_KOR_SCR			= vList(8,0)
	CGD_MATH_FLG		= vList(9,0)
	CGD_MATH_SCR		= vList(10,0)
	CGD_ENG_SCR			= vList(11,0)
	CGD_SUB_FLG			= vList(12,0)
	CGD_SUB1_NM			= vList(13,0)
	CGD_SUB1_SCR		= vList(14,0)
	CGD_SUB2_NM			= vList(15,0)
	CGD_SUB2_SCR		= vList(16,0)
	CGD_LANG_NM			= vList(17,0)
	CGD_LANG_SCR		= vList(18,0)
	CGD_SUSI_APP_FLG	= vList(19,0)
	CGD_SUSI_APP1_TXT	= vList(20,0)
	CGD_SUSI_APP2_TXT	= vList(21,0)
	CGD_SUSI_APP3_TXT	= vList(22,0)
	CGD_SUSI_APP4_TXT	= vList(23,0)
	CGD_SUSI_APP5_TXT	= vList(24,0)
	CGD_SUSI_APP6_TXT	= vList(25,0)
	CGD_COUS1_TXT		= vList(26,0)
	CGD_COUS1_DT		= vList(27,0)
	CGD_COUS1_CSTT		= vList(28,0)
	CGD_COUS1_REP		= vList(29,0)
	CGD_COUS1_REP_DT	= vList(30,0)
	CGD_COUS2_TXT		= vList(31,0)
	CGD_COUS2_DT		= vList(32,0)
	CGD_COUS2_CSTT		= vList(33,0)
	CGD_COUS2_REP		= vList(34,0)
	CGD_COUS2_REP_DT	= vList(35,0)
	CGD_REP_STAT		= vList(36,0)
	CGD_DEL_FLG			= vList(37,0)
	CGC_CSTT_ALIAS		= vList(38,0)
	
	CGD_SUSI_APP7_TXT	= vList(40,i)
	CGD_SUSI_APP8_TXT	= vList(41,i)
    CGD_UNIV_TXT        = vList(42,i)	
	
	Select Case CGD_REP_STAT
        Case "1"
            STAT_TXT = "답변대기중"
        Case "2"
            STAT_TXT = "답변완료"
        Case "3"
            STAT_TXT = "추가질문 답변대기중"
        Case "4"
            STAT_TXT = "추가질문 답변완료"
    End Select 
	
	iMode = "M"
	
	if IsNull(CGD_SUSI_APP2_TXT) = false And IsEmpty(CGD_SUSI_APP2_TXT) = false And CGD_SUSI_APP2_TXT <> "" Then CGD_SUSI_VIEW = 2 End If
	if IsNull(CGD_SUSI_APP3_TXT) = false And IsEmpty(CGD_SUSI_APP3_TXT) = false And CGD_SUSI_APP3_TXT <> "" Then CGD_SUSI_VIEW = 3 End If
	if IsNull(CGD_SUSI_APP4_TXT) = false And IsEmpty(CGD_SUSI_APP4_TXT) = false And CGD_SUSI_APP4_TXT <> "" Then CGD_SUSI_VIEW = 4 End If
	if IsNull(CGD_SUSI_APP5_TXT) = false And IsEmpty(CGD_SUSI_APP5_TXT) = false And CGD_SUSI_APP5_TXT <> "" Then CGD_SUSI_VIEW = 5 End If
	if IsNull(CGD_SUSI_APP6_TXT) = false And IsEmpty(CGD_SUSI_APP6_TXT) = false And CGD_SUSI_APP6_TXT <> "" Then CGD_SUSI_VIEW = 6 End If
	if IsNull(CGD_SUSI_APP7_TXT) = false And IsEmpty(CGD_SUSI_APP7_TXT) = false And CGD_SUSI_APP7_TXT <> "" Then CGD_SUSI_VIEW = 7 End If
	if IsNull(CGD_SUSI_APP8_TXT) = false And IsEmpty(CGD_SUSI_APP8_TXT) = false And CGD_SUSI_APP8_TXT <> "" Then CGD_SUSI_VIEW = 8 End If
	
	 If CGD_COUS1_REP <> "" Then
        CGD_COUS1_REP = Replace(CGD_COUS1_REP, """", "'")
        CGD_COUS1_REP = DB_TO_STR(CGD_COUS1_REP)
    End If
End If

BEF_REP_STAT = CGD_REP_STAT
If COOK_ID = "rndanswer" Then
	iMode           = "R"
	CGD_REP_STAT    = "999"	
End If



'------------------------------
' ETC
'------------------------------
SCI_SUB_SEL = "<option value=''>선택</option> " &_
			  "<option value='물리학Ⅰ'>물리학Ⅰ</option> " &_
              "<option value='물리학Ⅱ'>물리학Ⅱ</option> " &_
              "<option value='화학Ⅰ'>화학Ⅰ</option> " &_
              "<option value='화학Ⅱ'>화학Ⅱ</option> " &_
              "<option value='생명과학Ⅰ'>생명과학Ⅰ</option> " &_
              "<option value='생명과학Ⅱ'>생명과학Ⅱ</option> " &_
              "<option value='지구과학Ⅰ'>지구과학Ⅰ</option> " &_
              "<option value='지구과학Ⅱ'>지구과학Ⅱ</option>"
               
SOC_SUB_SEL = "<option value=''>선택</option> " &_
			  "<option value='한국지리'>한국지리</option> " &_
              "<option value='세계지리'>세계지리</option> " &_
              "<option value='동아시아사'>동아시아사</option> " &_
              "<option value='세계사'>세계사</option >" &_
              "<option value='생활과 윤리'>생활과 윤리</option> " &_
              "<option value='윤리와사상'>윤리와 사상</option> " &_
              "<option value='사회문화'>사회문화</option> " &_
              "<option value='정치와법'>정치와법</option> " &_
              "<option value='경제'>경제</option>"



%>
<!-- #include virtual="/common/menu/header.asp" -->

<!-- S : 2019 css, js -->
<link rel="stylesheet" type="text/css" href="/common/css/sd2019/reset.css?ver=<%=now()%>">
<link rel="stylesheet" type="text/css" href="/common/css/sd2019/board.css?ver=<%=now()%>">
<link rel="stylesheet" type="text/css" href="/common/css/sd2019/sd2019.css?ver=<%=now()%>">
<script type="text/javascript" src="/common/js/sd2019/lib/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/common/js/sd2019/lib/jquery-scrolltofixed-min.js"></script>
<script type="text/javascript" src="/common/js/sd2019/mo_common.js?ver=<%=now()%>"></script>
<style type="text/css">
	[data-depth1="N"][data-depth2="pre_scoring"] dl *[data-title="type2"]{ font-size:12px; font-weight:400; }
	.inline > span > input{ width:24%; } 
	.m_l11{ margin-left:.35rem !important; }
</style>
<!--// E : 2019 css, js -->

<body data-device="mobile" data-depth1="N" data-depth2="pre_scoring" data-depth3="registstep">
	<!-- Header Include Area S -->
    <!-- #include virtual="/common/menu/menu_on_2019.asp" -->
    <!-- Header Include Area E -->

	<div class="layout-container">
		<div class="content-layout">
			<h2 class="page-tit border-tit mb20">2022학년도 시대인재 N 가채점 상담신청</h2>

			<% if (iMode = "I") then %>
			<!-- S : STEP -->
			<div class="step-box">
				<h4 class="tit">STEP2 가채점 정보입력</h4>
				<ul class="step">
					<li class="prev">1</li>
					<li class="on">2</li>
					<li>3</li>
				</ul>
			</div>
			<!--// E : STEP -->
			<% else %>
			<!-- S : STEP -->
			<div class="step-box">
				<h4 class="tit">가채점 신청정보확인</h4>
				<ul class="step">
					<li class="prev">1</li>
					<li class="prev">2</li>
					<li class="prev">3</li>
				</ul>
			</div>
			<!--// E : STEP -->
			<% end if %>

			<div data-layout="type1">
				<h2 class="f_color3 m_b50" style="font-size:13px;"> <%=iif(EDIT_END_FLG = 1,"*가채점 상담신청 기간이 종료되어 수정 및 추가 질문이 불가 합니다.","")%> </h2>
				<form id="dataForm" name="dataForm" method="post">
					<input type="hidden" name="mst_seq" value="<%=mst_seq%>">
					<input type="hidden" name="authHP" value="<%=authHP%>">
					<input type="hidden" name="authNm" value="<%=authNm%>">
					<input type="hidden" name="iMode" value="<%=iMode%>">
					<input type="hidden" name="CGD_DTL_SEQ" value="<%=CGD_DTL_SEQ%>">
					<input type="hidden" name="sms_yn" value="<%=CGD_SMS_YN%>">
					<fieldset>
						<dl data-form="wrap" class="noline">
							<dt><label for="input1" class="field_name">이름<strong>*<em>필수항목</em></strong></label></dt>
							<dd><span data-form="input"><input type="text" id="CGD_USER_NM" name="CGD_USER_NM" readonly="readonly" value="<%=authNm%>"></span></dd>

							<dt><span class="field_name">휴대폰번호<strong>*<em>필수항목</em></strong></span></dt>
							<dd>
								<p class="m_b40">
									<span class="field_name"><%=authHP%></span>
								</p>
								<p><span class="field_name">상품, 입시정보, 이벤트 정보 등을 SMS로</span></p>
								<p>
									<span data-form="radio" class="type1">
										<input type="radio" id="radio1" name="CGD_SMS_YN" value="Y" <%=isChecked(blank2Text(CGD_SMS_YN,"Y"), "Y")%> <%=iif(CInt(CGD_REP_STAT) > 1," disabled='disalbed'","" )%>>
										<label for="radio1">받음</label>
									</span>
									<span data-form="radio" class="type1">
										<input type="radio" id="radio2" name="CGD_SMS_YN" value="N" <%=isChecked(CGD_SMS_YN, "N")%> <%=iif(CInt(CGD_REP_STAT) > 1, " disabled='disalbed'", "" )%>>
										<label for="radio2">받지 않음</label>
									</span>
								</p>
							</dd>
							<dt><span class="field_name">학원<strong>*<em>필수항목</em></strong></span></dt>
							<dd>
								<p>
									<span data-form="radio" class="type1">
										<input type="radio" id="radio3" name="CGD_CLASS_KBN" value="1" <%=isChecked(blank2Text(CGD_CLASS_KBN,"1"), "1")%> <%=iif(CInt(CGD_REP_STAT) > 1," disabled='disalbed'","" )%>>
										<label for="radio3">신관</label>
									</span>
                                    <span data-form="radio" class="type1">
										<input type="radio" id="radio4" name="CGD_CLASS_KBN" value="2" <%=isChecked(CGD_CLASS_KBN, "2")%> <%=iif(CInt(CGD_REP_STAT) > 1," disabled='disalbed'","" )%>>
										<label for="radio4">N관</label>
									</span>
									<span data-form="radio" class="type1">
										<input type="radio" id="radio5" name="CGD_CLASS_KBN" value="3" <%=isChecked(CGD_CLASS_KBN, "3")%> <%=iif(CInt(CGD_REP_STAT) > 1," disabled='disalbed'","" )%>>
										<label for="radio5">M3관</label>
									</span>
									<span data-form="radio" class="type1">
										<input type="radio" id="radio6" name="CGD_CLASS_KBN" value="4" <%=isChecked(CGD_CLASS_KBN, "4")%> <%=iif(CInt(CGD_REP_STAT) > 1," disabled='disalbed'","" )%>>
										<label for="radio6">브릿지관</label>
									</span>
									<span data-form="radio" class="type1">
										<input type="radio" id="radio7" name="CGD_CLASS_KBN" value="5" <%=isChecked(CGD_CLASS_KBN, "5")%> <%=iif(CInt(CGD_REP_STAT) > 1," disabled='disalbed'","" )%>>
										<label for="radio7">S관</label>
									</span>
									<span data-form="radio" class="type1">
										<input type="radio" id="radio8" name="CGD_CLASS_KBN" value="5" <%=isChecked(CGD_CLASS_KBN, "5")%> <%=iif(CInt(CGD_REP_STAT) > 1," disabled='disalbed'","" )%>>
										<label for="radio8">목동관</label>
									</span>
								</p>
							</dd>

							<dt><label for="input1" class="field_name">가채점 점수입력<strong>*<em>필수항목</em></strong></label></dt>
							<dd>
								<p>
									<span class="field_name m_b10">한국사</span>
									<span data-form="input"><input title="한국사" type="text" id="CGD_HIS_SCR" name="CGD_HIS_SCR" value="<%=CGD_HIS_SCR%>" numberonly maxlength="3" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%> onkeyup="IfSCRChk(50,this)"></span>
								</p>
								<div class="m_b30">
									<span class="field_name m_b10">국어</span>
									<p class="m_b20">
										<span data-form="radio">
											<input type="radio" id="radio10" value="언매" name="CGD_KOR_FLG" <%=iif(CGD_MATH_FLG = "언매", "checked", "") %> <%=iif(CInt(CGD_REP_STAT) > 1, " onclick ='return false;'", "" )%>>
											<label for="radio10">언매</label>
										</span>
										<span data-form="radio">
											<input type="radio" id="radio11" value="화작" name="CGD_KOR_FLG" <%=iif(CGD_MATH_FLG = "화작", "checked", "") %> <%=iif(CInt(CGD_REP_STAT) > 1, " onclick ='return false;'", "" )%>>
											<label for="radio11">화작</label>
										</span>
									</p>
									<span class="field_name m_b10">국어 필수</span>
									<p class="m_b10">
										<span data-form="input">
											<input title="국어" type="text" id="CGD_KOR_SCR" name="CGD_KOR_SCR" value="<%=CGD_KOR_SCR%>" numberonly maxlength="3" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%> onkeyup="IfSCRChk(100,this)">
										</span>
									</p>
									<span class="field_name m_b10">국어 선택</span>
									<p class="m_b10">
										<span data-form="input">
											<input title="국어" type="text" id="CGD_KOR_SCR" name="CGD_KOR_SCR" value="<%=CGD_KOR_SCR%>" numberonly maxlength="3" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%> onkeyup="IfSCRChk(100,this)">
										</span>
									</p>
								</div>
								<div class="m_b30">
									<span class="field_name m_b10">수학</span>
									<p class="m_b20">
										<span data-form="radio" style="width:33%">
											<input type="radio" id="radio13" value="확통" name="CGD_MATH_FLG" <%=iif(CGD_MATH_FLG = "확통", "checked", "") %> <%=iif(CInt(CGD_REP_STAT) > 1, " onclick ='return false;'", "" )%>>
											<label for="radio13">확통</label>
										</span>
										<span data-form="radio" style="width:33%">
											<input type="radio" id="radio14" value="미적" name="CGD_MATH_FLG" <%=iif(CGD_MATH_FLG = "미적", "checked", "") %> <%=iif(CInt(CGD_REP_STAT) > 1, " onclick ='return false;'", "" )%>>
											<label for="radio14">미적</label>
										</span>
										<span data-form="radio" style="width:33%">
											<input type="radio" id="radio15" value="기하" name="CGD_MATH_FLG" <%=iif(CGD_MATH_FLG = "기하", "checked", "") %> <%=iif(CInt(CGD_REP_STAT) > 1, " onclick ='return false;'", "" )%>>
											<label for="radio15">기하</label>
										</span>
									</p>
									<span class="field_name m_b10">수학 필수</span>
									<p class="m_b10">
										<span data-form="input">
											<input title="수리영역" type="text" id="CGD_MATH_SCR" name="CGD_MATH_SCR" value="<%=CGD_MATH_SCR%>" numberonly maxlength="3" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%> onkeyup="IfSCRChk(100,this)">
										</span>
									</p>
									<span class="field_name m_b10">수학 선택</span>
									<p class="m_b10">
										<span data-form="input">
											<input title="수리영역" type="text" id="CGD_MATH_SCR" name="CGD_MATH_SCR" value="<%=CGD_MATH_SCR%>" numberonly maxlength="3" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%> onkeyup="IfSCRChk(100,this)">
										</span>
									</p>
								</div>
								<p class="m_b30">
									<span class="field_name m_b10">영어</span>
									<span data-form="input"><input title="영어" type="text" id="CGD_ENG_SCR" name="CGD_ENG_SCR" value="<%=CGD_ENG_SCR%>" numberonly maxlength="3" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%> onkeyup="IfSCRChk(100,this)"></span>
								</p>
								<div class="m_b30">
									<p class="m_b20">
										<span data-form="radio">
											<input type="radio" id="radio16" name="CGD_SUB_FLG" value="과학"  <%=iif(CGD_SUB_FLG = "과학", "checked", "") %> <%=iif(CInt(CGD_REP_STAT) > 1, " onclick ='return false;'", " onclick=""IfSubSel('SC')"" " )%>>
											<label for="radio16">과학</label>
										</span>
										<span data-form="radio">
											<input type="radio" id="radio17" name="CGD_SUB_FLG" value="사회" <%=iif(CGD_SUB_FLG = "사회", "checked", "") %> <%=iif(CInt(CGD_REP_STAT) > 1, " onclick ='return false;'", " onclick=""IfSubSel('SO')"" " )%>>
											<label for="radio17">사회</label>
										</span>
									</p>
									<p class="m_b20">
										<span data-form="select" class="full m_b20">
											<select title="선택과목1" name="CGD_SUB1_NM" id="CGD_SUB1_NM" <%=iif(CInt(CGD_REP_STAT) > 1, " disabled='disalbed'", "" )%> onChange="IfSubFlg('1');">
												<% If CGD_SUB_FLG = "과학" Then %>
                                                    <%=SCI_SUB_SEL%>
												<% ElseIf  CGD_SUB_FLG = "사회" Then %>
													<%=SOC_SUB_SEL%>
												<% Else %>
												    <option value="">선택</option>
												<% End If %>
											</select>
										</span>
										<span data-form="input"><input title="탐구 선택" type="text" id="CGD_SUB1_SCR" name="CGD_SUB1_SCR" value="<%=CGD_SUB1_SCR%>" numberonly maxlength="3" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%> onkeyup="IfSCRChk(50,this)"></span>
									</p>
									<p>
										<span data-form="select" class="full m_b20">
											<select title="선택과목2" name="CGD_SUB2_NM" id="CGD_SUB2_NM" <%=iif(CInt(CGD_REP_STAT) > 1, " disabled='disalbed'", "" )%> onChange="IfSubFlg('2');" >
												<% If CGD_SUB_FLG = "과학" Then %>
													<%=SCI_SUB_SEL%>
												<% ElseIf  CGD_SUB_FLG = "사회" Then %>
													<%=SOC_SUB_SEL%>
												<% Else %>
												    <option value="">선택</option>
												<% End If %>
											</select>
										</span>
										<span data-form="input"><input title="탐구 선택" type="text" id="CGD_SUB2_SCR" name="CGD_SUB2_SCR" value="<%=CGD_SUB2_SCR%>" numberonly maxlength="3" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%> onkeyup="IfSCRChk(50,this)"></span>
									</p>
								</div>
								<p>
									<span class="field_name m_b10">제2외국어</span>
									<span data-form="select" class="full m_b20">
										<select title="제2외국어 과목" name="CGD_LANG_NM" id="CGD_LANG_NM" <%=iif(CInt(CGD_REP_STAT) > 1, " disabled='disalbed'", "" )%>>
											<option value="미선택" <%=iif(CGD_LANG_NM="미선택", "selected='selected'", "")%>>미선택</option>
											<option value="아랍어" <%=iif(CGD_LANG_NM="아랍어", "selected='selected'", "")%>>아랍어</option>
											<option value="일본어" <%=iif(CGD_LANG_NM="일본어", "selected='selected'", "")%>>일본어</option>
											<option value="중국어" <%=iif(CGD_LANG_NM="중국어", "selected='selected'", "")%>>중국어</option>
											<option value="독일어" <%=iif(CGD_LANG_NM="독일어", "selected='selected'", "")%>>독일어</option>
											<option value="프랑스어" <%=iif(CGD_LANG_NM="프랑스어", "selected='selected'", "")%>>프랑스어</option>
											<option value="스페인어" <%=iif(CGD_LANG_NM="스페인어", "selected='selected'", "")%>>스페인어</option>
											<option value="한문" <%=iif(CGD_LANG_NM="한문", "selected='selected'", "")%>>한문</option>
											<option value="베트남어" <%=iif(CGD_LANG_NM="베트남어", "selected='selected'", "")%>>베트남어</option>
											<option value="러시아어" <%=iif(CGD_LANG_NM="러시아어", "selected='selected'", "")%>>러시아어</option>
											</select>
										</select>
									</span>
									<span data-form="input"><input title="제2외국어" type="text" id="CGD_LANG_SCR" name="CGD_LANG_SCR" value="<%=CGD_LANG_SCR%>" numberonly maxlength="3" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%> onkeyup="IfSCRChk(50,this)"></span>
								</p>
							</dd>

							<dt><span class="field_name">수시원서 접수내역<strong>*<em>필수항목</em></strong></span></dt>
							<dd>
								<p>
									<span data-form="radio">
										<input type="radio" id="radio18" name="CGD_SUSI_APP_FLG" value="N" <%=iif(iMode="I" Or CGD_SUSI_APP_FLG = "N", "checked", "")%> onclick="IfSUSIFlg('N')" <%=iif(CInt(CGD_REP_STAT) > 1, " disabled='disalbed'", "" )%>>
										<label for="radio18">미접수</label>
									</span>
									<span data-form="radio">
										<input type="radio" id="radio19" name="CGD_SUSI_APP_FLG" value="Y" <%=iif(CGD_SUSI_APP_FLG = "Y", "checked", "")%>  onclick="IfSUSIFlg('Y')" <%=iif(CInt(CGD_REP_STAT) > 1, " disabled='disalbed'", "" )%>>
										<label for="radio19">접수</label>
									</span>
								</p>
								<p>
									<div id="CGD_SUSI_APP1" class="flex-area m_b10">
										<span data-form="input">
											<input type="text" id="CGD_SUSI_APP1_TXT" class="ph_small" name="CGD_SUSI_APP1_TXT" placeholder="대학" value="<%=CGD_SUSI_APP1_TXT%>" <%=iif(iMode="I" Or CGD_SUSI_APP_FLG = "N", " disabled='disabled' ", "" )%> <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%>>
										</span>
										<span data-form="input">
											<input type="text"  id="CGD_UNI_APP1_TXT" class="ph_small" name="" placeholder="전형" value="" <%=iif(iMode="I" Or CGD_SUSI_APP_FLG = "N", " disabled='disabled' ", "" )%> <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%>>
										</span>
										<span data-form="input">
											<input type="text"  id="CGD_MAJ_APP1_TXT"  class="ph_small" name="" placeholder="학부(학과)" value="" <%=iif(iMode="I" Or CGD_SUSI_APP_FLG = "N", " disabled='disabled' ", "" )%> <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%>>
										</span>
										<button type="button" data-btn="whitegray" class="mb10" id="btnSUSIAdd" onclick="IfLineAdd();" disabled style="cursor:default;">추가</button>
									</div>
									<% for i =2 to 8 
										APP_TXT = ""
										
										If i=2 Then APP_TXT = CGD_SUSI_APP2_TXT End If
										If i=3 Then APP_TXT = CGD_SUSI_APP3_TXT End If
										If i=4 Then APP_TXT = CGD_SUSI_APP4_TXT End If
										If i=5 Then APP_TXT = CGD_SUSI_APP5_TXT End If
										If i=6 Then APP_TXT = CGD_SUSI_APP6_TXT End If
										If i=7 Then APP_TXT = CGD_SUSI_APP7_TXT End If
										If i=8 Then APP_TXT = CGD_SUSI_APP7_TXT End If
								%>
									<div class="inline m_b10">
										<span data-form="input" class="full" id="CGD_SUSI_APP<%=i%>" <%=iif(i<=CGD_SUSI_VIEW, "", "style='display:none;'") %>>
											<input type="text" id="CGD_SUSI_APP<%=i%>_TXT" class="ph_small" name="CGD_SUSI_APP<%=i%>_TXT" placeholder="대학" value="<%=APP_TXT%>" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%>>
										
											<input type="text" id="CGD_SUSI_APP<%=i%>_TXT" class="ph_small m_l11" name="CGD_SUSI_APP<%=i%>_TXT" placeholder="전형" value="<%=APP_TXT%>" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%>>
									
											<input type="text" id="CGD_SUSI_APP<%=i%>_TXT" class="ph_small m_l11" name="CGD_SUSI_APP<%=i%>_TXT" placeholder="학부(학과)" value="<%=APP_TXT%>" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%>>
										</span>
									</div>
								<% Next %>
								</p>
							</dd>

							<dt><span class="field_name">현재 재학중인 대학<br>(없을 경우 없음으로 기재)</span></dt>
							<dd><span data-form="input"><input type="text" id="CGD_UNIV_TXT" name="CGD_UNIV_TXT" value="<%=CGD_UNIV_TXT%>" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%>></span></dd>
							
							<dt>
								<span class="field_name">※본 상담은 가채점 점수를 기준으로 한 상담이므로 변동성이 있을 수 있으니 참고 자료로써<br>다른 자료와 종합적으로 판단/활용해 주시길 바랍니다.(500자 이하)</span>
							</dt>

							<dt><span class="field_name">가채점 상담 문의</span></dt>
							<dd>
								<h3 data-title="type2" class="mb0">질문</h3>
								<div data-layout="type1">
									<textarea name="CGD_COUS1_TXT" id="CGD_COUS1_TXT" data-form="textarea" class="type2" placeholder="가채점 상담내용을 500자 이내로 작성하세요." maxlength="500" <%=iif(CInt(CGD_REP_STAT) > 1, " readonly='readonly'", "" )%>><%=CGD_COUS1_TXT%></textarea>
								</div>
								
								<ul data-text="type1" style="margin-top:10px;" class="t_right" <%=iif(iMode <> "I" And COOK_ID <> "rndanswer" , "", "style='display:none;'" )%>>
									<li class="f_color3 line" style="font-size:12px;"><%=iif(CInt(BEF_REP_STAT) > 1, "답변완료", STAT_TXT )%></li>
								</ul>
								
								<h3 data-title="type2" class="reply mb0" <%=iif(CInt(CGD_REP_STAT) > 1 or COOK_ID = "rndanswer", "", "style='display:none;'" )%>>답변</h3>
								<div data-detail="type3" class="m_b20 noline" <%=iif(CInt(CGD_REP_STAT) > 1 And COOK_ID <> "rndanswer" , "", "style='display:none;'" )%>>
									<div data-box="reply">
										<p class="reply_title">
											<span class="">시대인재 입시컨설턴트</span>
											<span class="write_date" style="font-size:13px;"><%=CGD_COUS1_DT%></span>
										</p>
										<div class="reply_text">
											<%=CGD_COUS1_REP%>
										</div>
									</div>
								</div>
                                <!--
								<div data-layout="type1" <%=iif(COOK_ID="rndanswer", "", "style=display:none;")%>>
									<textarea style="margin-bottom:20px;" name="CGD_REP1_TXT" id="CGD_REP1_TXT" data-form="textarea" class="type2" placeholder="상담내용 답변을 입력하세요."  <%=iif(CInt(BEF_REP_STAT) > 2, " readonly='readonly'", "" )%>><%=CGD_COUS1_REP%></textarea>
								</div>
								<h3 class="mb0" data-title="type2" <%=iif(((CInt(BEF_REP_STAT) > 1 And COOK_ID <> "rndanswer") or (CInt(BEF_REP_STAT) > 2 And COOK_ID = "rndanswer"))  And OPEN_FLG = 1, "", "style='display:none;'" )%>>추가질문 </h3>
								<div data-layout="type1" class="m_b40" <%=iif(CInt(BEF_REP_STAT) > 1 And OPEN_FLG = 1 , "", "style='display:none;'" )%>>
									<textarea data-form="textarea" name="CGD_COUS2_TXT" id="CGD_COUS2_TXT" class="type2" maxlength="500" placeholder="답변 완료된 상담글에 대해 1회 추가 질문을 하실 수 있습니다. 추가 질문이 있는 경우 500자 이내로 작성하세요." rows="1" <%=iif(CInt(BEF_REP_STAT) = 4 or COOK_ID="rndanswer", " readonly='readonly'", "" )%>><%=CGD_COUS2_TXT%></textarea>
								</div>
								<ul data-text="type1" class="t_right <%=CInt(CGD_REP_STAT)%>" style="margin-top:10px; <%=iif(CInt(CGD_REP_STAT) > 2  And COOK_ID <> "rndanswer", "", " display:none; " )%>">
									<li class="f_color3 line"><%=STAT_TXT%></li>
								</ul>
								
								<h3 data-title="type2" class="reply" <%=iif((CInt(BEF_REP_STAT) > 3  And COOK_ID <> "rndanswer") or (CInt(BEF_REP_STAT) > 2 And COOK_ID = "rndanswer" ), "", "style='display:none;'" )%>>추가질문 답변</h3>
								<div data-detail="type3" <%=iif(CInt(CGD_REP_STAT) > 3  And COOK_ID <> "rndanswer", "", "style='display:none;'" )%>>
									<div data-box="reply">
										<p class="reply_title">
											<span class="">시대인재 입시컨설턴트</span>
											<span class="write_date" style="font-size:13px;"><%=CGD_COUS2_DT%></span>
										</p>
										<div class="reply_text">
											<%=CGD_COUS2_REP%>
										</div>
									</div>
								</div>
								<div data-layout="type1" <%=iif(COOK_ID="rndanswer" And CInt(BEF_REP_STAT) > 2, "", "style=display:none;")%>>
									<textarea name="CGD_REP2_TXT" id="CGD_REP2_TXT" data-form="textarea" class="type2" placeholder="상담내용 답변을 입력하세요."><%=CGD_COUS2_REP%></textarea>
								</div>
                                -->
							</dd>
						</dl>

						<p data-form="checkbox" class="type1">
							<span>개인정보 수집 및 활용 동의</span>
							<input type="checkbox" id="agree" name="agree" checked value="Y">
							<label for="agree">네, 개인정보 수집, 이용에 동의합니다.</label>
						</p>
						<div data-layout="type1">
				<textarea data-form="textarea" readonly="readonly" style="font-size:12px;">
	시대인재N학원은 원활한 상담 처리를 위해 아래와 같이 개인정보를 수집&middot;이용하고자 합니다.
	내용을 읽으신 후 동의 여부를 결정하여 주십시오.

	[수집항목] 이름, 연락처, 가채점점수, 수시원서 접수 내역
	[수집목적] 상담내역 확인 및 상담, 답변 안내, 학습 및 입시정보제공 등에 사용
	[개인정보의 보유 및 이용기간 1년

	* 개인정보 수집 및 이용 동의를 하지 않을 경우 관련 서비스의 제한이 있을 수 있습니다.
				</textarea>
						</div>
						<div class="btn_wrap">
							<button type="button" class="btn btn-black" onclick="<%=iif(EDIT_END_FLG = 0,(iif(CGD_REP_STAT<>"4",(iif(COOK_ID="rndanswer", "IfSave();", "IfSave();")),"IfBefore();")), "IfStu();")%>"> <%=iif(EDIT_END_FLG = 0,(iif(COOK_ID="rndanswer" Or CGD_REP_STAT="2" Or CGD_REP_STAT="",(iif(COOK_ID="rndanswer", "답변완료", "신청하기")),"신청완료 페이지")), "신청기간 종료")%></button>
							<!--
							<button type="button" data-btn="navy" onclick="<%=iif(COOK_ID="rndanswer", "IfSave();", "IfStu();")%>" <%=iif(CGD_REP_STAT="4", " disabled='disabled' readonly='readonly' ","")%>> <%=iif(COOK_ID="rndanswer", "답변완료", "신청기간 종료")%></button>
							-->
						</div>

					</fieldset>
				</form>
			</div>
		</div>
	</div>

<script type="text/javascript">
var CGD_SUSI_VIEW = <%=CGD_SUSI_VIEW%>

var IfStu = function() {
    alert("가채점 상담신청 기간이 종료되어 수정 할 수 없습니다.");
    return false;
};

var IfSCRChk = function(max_p, obj) {    
    var n_point = $(obj).val();
    
    if (parseInt(n_point) > parseInt(max_p)) {   
        alert($(obj).attr("title") +" 과목은 " + max_p + "점을 초과하여 점수를 입력할 수 없습니다." );
        $(obj).val("");
        $(obj).focus();
        return false;
    }
};

//선택과목 과학, 사회 선택
var IfSubSel = function(flg) {
    if (flg == "SC") {
        $("select[name='CGD_SUB1_NM']").html("<%=SCI_SUB_SEL%>");
        $("select[name='CGD_SUB2_NM']").html("<%=SCI_SUB_SEL%>");
    } else {
        $("select[name='CGD_SUB1_NM']").html("<%=SOC_SUB_SEL%>");
        $("select[name='CGD_SUB2_NM']").html("<%=SOC_SUB_SEL%>");
    }
};

//수시원서 접수내역 접수, 미접수 선택
var IfSUSIFlg = function(flg) {
    if (flg == "Y") {        
        $("#CGD_SUSI_APP1_TXT").prop("disabled", false);
		$("#CGD_UNI_APP1_TXT").prop("disabled", false);
		$("#CGD_MAJ_APP1_TXT").prop("disabled", false);
        $("#btnSUSIAdd").prop("disabled", false);
        
        for (var i=2; i<=6; i++) {
            if (i<=<%=CGD_SUSI_VIEW%>) {
                $("#CGD_SUSI_APP"+i).show();
            } else {
                $("#CGD_SUSI_APP"+i).hide();
            }
        }
    } else {
        CGD_SUSI_VIEW = 1
        
        $("#CGD_SUSI_APP1_TXT").prop("disabled", true);
		$("#CGD_UNI_APP1_TXT").prop("disabled", true);
		$("#CGD_MAJ_APP1_TXT").prop("disabled", true);
        $("#CGD_SUSI_APP1_TXT").val("");
        $("#btnSUSIAdd").prop("disabled", true);
        
        for (var i=2; i<=6; i++) {
            $("#CGD_SUSI_APP"+i+"_TXT").val("");
            $("#CGD_SUSI_APP"+i).hide();
        }
    }
};

//수시원서 접수내역 추가 버튼 클릭
var IfLineAdd = function() {
    CGD_SUSI_VIEW = CGD_SUSI_VIEW + 1;
    
    if (CGD_SUSI_VIEW > 8) {
        alert("접수내역은 최대 8행 까지 입력 가능합니다.");
        return false;
    } else {
        $("#CGD_SUSI_APP"+CGD_SUSI_VIEW).show();
    }
};

var IfSave = function() {
	if (!$("input[name='CGD_KOR_FLG']").is(':checked')) {
        alert("국어영역 선택은 필수 입력 항목입니다.")
        return false;
    }
    if (!$("input[name='CGD_MATH_FLG']").is(':checked')) {
        alert("수리영역 선택은 필수 입력 항목입니다.")
        return false;
    }
    if ($("input[name='CGD_HIS_SCR']").val() == "") {
        alert("한국사 점수는 필수 입력 항목입니다.")
        return false;
    }
    
    if ($("input[name='CGD_KOR_SCR']").val() == "") {
        alert("국어 점수는 필수 입력 항목입니다.")
        return false;
    }
    
    if ($("input[name='CGD_MATH_SCR']").val() == "") {
        alert("수학 점수는 필수 입력 항목입니다.")
        return false;
    }
    
    if ($("input[name='CGD_ENG_SCR']").val() == "") {
        alert("영어 점수는 필수 입력 항목입니다.")
        return false;
    }
    
    if (!$("input[name='CGD_SUB_FLG']").is(':checked')) {
        alert("탐구과목 영역 선택은 필수 입력 항목입니다.")
        return false;
    }
    
    if ($("select[name='CGD_SUB1_NM']").val() == "") {
        alert("탐구과목1 선택은 필수 입력 항목입니다.")
        return false;
    }
    
    if ($("select[name='CGD_SUB2_NM']").val() == "") {
        alert("탐구과목2 선택은 필수 입력 항목입니다.")
        return false;
    }
    
    if ($("input[name='CGD_SUB1_SCR']").val() == "") {
        alert("탐구과목1 점순는 필수 입력 항목입니다.")
        return false;
    }
    
    if ($("input[name='CGD_SUB2_SCR']").val() == "") {
        alert("탐구과목2 점수는 필수 입력 항목입니다.")
        return false;
    }
    
    if ($("select[name='CGD_LANG_NM']").val() != "미선택") {
        if ($("input[name='CGD_LANG_SCR']").val() == "") {    
            alert("제2외국어 과목이 미선택이 아닐시 점수는 필수 입력 항목입니다.")
            return false;
        }
    }
    
    if ($("input[name='CGD_SUSI_APP_FLG']:checked").val() == "Y") {    
        if ($("input[name='CGD_SUSI_APP1_TXT']").val() == "") {        
            alert("수시원서 접수내역이 접수일 경우 내역은 필수 입력 항목입니다.")
            return false;
        }
    }
    
    if ($('input[name="agree"]:checked').val() != "Y") {
        alert("개인 정보 수집 및 활용동의를 하셔야 합니다.");
        return false;
    }
    
    $.ajax({
        type: "POST",
        url: "./apply_proc.asp",
        timeout: 5000,
        data: $("#dataForm").serializeArray(),
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        async: false,
        dataType: "json",
        success: function(msg) {
            if (msg.result == 200 || msg.result == 300){
                document.dataForm.action = "./apply_ok.asp";
                document.dataForm.submit();
            }
        },
        error : function(data, msg) {
            alert("관리자에게 문의하세요.(" + msg + ")");
        }
    });
}

var IfBefore = function(){
    document.dataForm.action = "./apply_ok.asp";
    document.dataForm.submit();
};

var IfSubFlg = function(sType) {    
    if(sType == "1") {
        var sub1Val = $("select[name='CGD_SUB1_NM']").val()
        
        $("select[name='CGD_SUB2_NM']").children('option').each(function() {        
            if ($(this).val() == sub1Val && $(this).val() != "") {
                $(this).attr('disabled', true);
            } else {
                $(this).attr('disabled', false);
            }                
        });
    } else {
        var sub2Val = $("select[name='CGD_SUB2_NM']").val()
        
        $("select[name='CGD_SUB1_NM']").children('option').each(function() {
            if ($(this).val() == sub2Val  &&  $(this).val() != "") {
                $(this).attr('disabled', true);
            } else {
                $(this).attr('disabled', false);
            }
        });
    }
};

$(function() {
    $(document).on("keyup", "input:text[numberonly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
    
    var selSub1 = "<%=CGD_SUB1_NM%>";
    $("select[name='CGD_SUB1_NM']").val(selSub1);
    
    var selSub2 = "<%=CGD_SUB2_NM%>";
    $("select[name='CGD_SUB2_NM']").val(selSub2);
        
    var susiFlg = "<%=CGD_SUSI_APP_FLG%>";
    if (susiFlg == "Y" && "<%=iif(CInt(CGD_REP_STAT) > 1, "False", "True" )%>" == "True") {
        $("#CGD_SUSI_APP1_TXT").prop("disabled", false);
        $("#CGD_SUSI_APP1_TXT").val("<%=CGD_SUSI_APP1_TXT%>");
        $("#btnSUSIAdd").prop("disabled", false);
    }    
});
</script>

	<!-- footer Include Area S -->
    <!-- #include virtual="/common/menu/footer_2019.asp" -->
    <!-- footer Include Area E -->