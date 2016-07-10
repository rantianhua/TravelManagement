<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="navigation.jsp"%>

<html>
<link href="${pageContext.request.contextPath }/css/showapplication.css"
	rel="stylesheet">
  <body>
   <div id="container">
   <table class="table table-bordered">
   <thead>
    <tr>
    <th colspan="6" class="head">
          基本信息
     </th>
    </tr>
   </thead>
     <tbody>
     <tr>
        <td class="attributes">
                 是否委托
        </td>
        <td class="answer">
                 是
        </td>
        <td class="attributes">
              身份证号
        </td> 
        <td colspan="3" class="answer">
         421102199411130837
        </td>   
     </tr>
     <tr>
         <td class="attributes">
                姓名
         </td>
         <td class="answer">
               雷兴照
         </td>
         <td class="attributes">
                性别
         </td>
         <td class="answer">
                男
         </td>
         <td class="attributes">
                  身份
        </td>
        <td class="answer">
                教师
        </td>
        </tr>
      <tr>
         <td class="attributes">
                生日
         </td>
         <td class="answer">
               1994-11-13
         </td>  
         <td class="attributes">
                证照名称
         </td>
         <td class="answer">
               美国护照
         </td>  
         <td class="attributes">
                有效日期
         </td>
         <td class="answer">
              2017-11-13
         </td>      
      </tr>
     </tbody>  
     <thead>
        <tr>
       <th colspan="6" class="head">
             出访目的
         </th>
        </tr>
     </thead>
     <tbody>
     
     <!-- 培训 -->
     <tr>
          <td class="attributes">
                长期/短期
         </td>
         <td class="answer">
               长期
         </td>   
       <td class="attributes">
                出访目的
         </td>
         <td class="answer"colspan="3" >
             培训
         </td>  
     </tr>
      <tr>
      <td class="attributes">
              培训内容
         </td>
         <td class="answer"colspan="5" >
         111111111111111111111111111111111111111
         </td>  
      </tr>   
      <tr>
      <td></td>
      </tr>
      
    <!-- 进修 -->
     <tr>
          <td class="attributes">
                长期/短期
         </td>
         <td class="answer">
               长期
         </td>   
       <td class="attributes">
                出访目的
         </td>
         <td class="answer"colspan="3" >
                进修
         </td>  
     </tr>
     <tr>
      <td class="attributes" >
                  进修内容
         </td>
         <td class="answer"colspan="5" >
         11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
         </td>  
      </tr>  
      
     
      
       <tr>
      <td class="attributes">
                  指导老师姓名
         </td>
         <td class="answer">
                  韩源
         </td>  
         <td class="attributes">
                  指导老师头衔
         </td>
         <td class="answer" >
                  韩源
         </td>  
         <td class="attributes">
                  指导老师专长
         </td>
         <td class="answer">
                  出入境管理
         </td> 
      </tr>   
       <tr>
    <td></td>
      </tr>
      
      <!-- 攻读学位 -->
      <tr>
          <td class="attributes">
                长期/短期
         </td>
         <td class="answer">
               长期
         </td>   
       <td class="attributes">
                出访目的
         </td>
         <td class="answer">
                攻读学位
         </td>  
         <td class="attributes">
             学位类别    
          </td>
         <td class="answer">
               工科
         </td>   
     </tr>
      <tr>
      <td class="attributes">
                  指导老师姓名
         </td>
         <td class="answer" >
                  韩源
         </td>  
         
         <td class="attributes">
                  指导老师头衔
         </td>
         <td class="answer" >
                  韩源
         </td>  
         <td class="attributes">
                  指导老师专长
         </td>
         <td class="answer">
                  出入境管理
         </td> 
      </tr>
     <tr><td></td></tr>
     <!-- 科研合作 --> 
      
     <tr>
          <td class="attributes">
                长期/短期
         </td>
         <td class="answer">
               长期
         </td>   
       <td class="attributes">
                出访目的
         </td>
         <td class="answer" colspan="3">
                科研合作
         </td>  
     </tr> 
      <tr>
      <td class="attributes">
                合作内容
      </td>
      <td class="answer"colspan="5" >
      11111111111111111111111111111111111
      </td>
      </tr>
      <tr>
      <td class="attributes">
                  外方合作伙伴姓名
         </td>
         <td class="answer">
                  韩源
         </td>  
         <td class="attributes">
                  外方合作伙伴头衔
         </td>
         <td class="answer" >
                  韩源
         </td>  
         <td class="attributes">
                  外方合作伙伴专长
         </td>
         <td class="answer">
                  出入境管理
         </td> 
      </tr>
     <tr><td></td></tr>
      
      <!-- 任教 --> 
        <tr>
          <td class="attributes">
                长期/短期
         </td>
         <td class="answer">
               长期
         </td>   
       <td class="attributes">
                出访目的
         </td>
         <td class="answer" >
               任教
         </td>  
           <td class="attributes">
                授课名称
      </td>
      <td class="answer">
               软件工程
      </td>
     </tr> 
      
      <tr>
      <td class="attributes">
                  外方合作伙伴姓名
         </td>
         <td class="answer">
                  韩源
         </td>  
         <td class="attributes">
                  外方合作伙伴头衔
         </td>
         <td class="answer" >
                  韩源
         </td>  
         <td class="attributes" >
                  外方合作伙伴专长
         </td>
         <td class="answer">
                  出入境管理
         </td> 
      </tr>
     <tr><td></td></tr>
      
      <!-- 参加国际会议 -->
      <tr>
          <td class="attributes">
                长期/短期
         </td>
         <td class="answer">
               长期
         </td>   
       <td class="attributes">
                出访目的
         </td>
         <td class="answer" colspan="3">
               参加国际会议
         </td>  
         
         <tr>
          <td class="attributes">
                会议中文名
         </td>
         <td class="answer">
               出入境管理大会
         </td>   
       <td class="attributes">
                会议英文名
         </td>
         <td class="answer" >
         churujingguanlidahui
         </td>  
         <td class="attributes">
                  是否受邀发言
         </td>  
         <td class="attributes" >
                  是（此处控制本段最后两行）
         </td>
         
        <tr>
        <td class="attributes">
                会议情况简介
         </td>
         <td class="answer" colspan="5">
               1111111111111111111111111111111111111111
         </td>   
        </tr>
       
        <tr>
             <td class="attributes">
                发言提纲
         </td>
         <td class="answer" colspan="5">
              <a>超链接在此</a>
         </td>   
        </tr>
        <tr>
             <td class="attributes">
                论文提纲
         </td>
         <td class="answer" colspan="5">
             11111111111111111111111111111111111111111111111111111111111111111111111111111
         </td>   
        </tr>
        <tr><td></td></tr>
     </tbody>
     <thead>
      <tr>   
      <th colspan="6" class="head">  
                      出境路线
           </th>
           </tr>
     </thead>
     <tbody>
        <tr>
         <td class="attributes"colspan="2" >
                离境城市
         </td>
         <td class="answer" >
                济南
         </td>   
         <td class="attributes"colspan="2" >
                离境日期
         </td>
         <td class="answer">
                2017-12-5
         </td>  
         </tr>
         <tr>
          <td class="attributes" colspan="2">
                回国入境城市
         </td>
         <td class="answer" >
                济南
         </td>   
         <td class="attributes"colspan="2">
                入境日期
         </td>
         <td class="answer">
                2019-7-5
         </td>   
        </tr>
           
           <!-- 此处循环控制 --> 
            <tr>
            <td class="attributes"colspan="2">
               抵达国家
         </td>
         <td class="answer" colspan="2">
                美国
         </td>   
         <td class="attributes">
                抵达城市
         </td>
         <td class="answer" >
                旧金山
         </td>   
         </tr>
         <tr>
         <td class="attributes"colspan="2">
                抵达日期
         </td>
         <td class="answer"colspan="2" >
                2017-12-8
         </td>   
         <td class="attributes">
               是否转机
         </td>
         <td class="answer" >
                否
         </td>   
        </tr>
        <tr>
          <td class="attributes"colspan="2" >
                     转机地点
          </td>
           <td class="answer"colspan="4" >
             夏威夷-旧金山        
          </td>
        </tr>
     </tbody>
     <thead>
      <tr>
          <th colspan="6" class="head">
                  参团情况
          </th>
    </tr>
     </thead>
     <tbody>
     <tr>
         <td class="attributes"colspan="3">
               是否参团
         </td>
         <td class="answer" colspan="3">
                是(此处控制)
         </td>   
         </tr>
     <tr>
     <td class="attributes"colspan="1">
               组团单位
         </td>
         <td class="answer" colspan="2">
               山东大学
         </td>   
     <td class="attributes"colspan="1">
               出访审批单位
         </td>
         <td class="answer" colspan="2">
               山东大学
         </td>  
     </tr>
     <tr>
     <td class="attributes"colspan="1">
               団组职务
         </td>
         <td class="answer" colspan="2">
             团员
         </td>   
     <td class="attributes"colspan="1">
            成员名单   
         </td>
         <td class="answer" colspan="2">
               <a>超链接在此</a>
         </td>  
     </tr>
     </tbody>
       <thead>
      <tr>
          <th colspan="6" class="head">
                  邀请方信息
          </th>
    </tr>
     </thead> 
     <tbody>
       <tr>
         <td class="attributes">
               是否参团
         </td>
         <td class="answer" colspan="5">
                是(此处控制)
         </td>  
      </tr>
     <tr>
         <td class="attributes">
               姓名
         </td>
         <td class="answer">
               冉天华
         </td>  
          <td class="attributes">
               中文头衔
         </td>
         <td class="answer">
               冉日天
         </td>  
          <td class="attributes">
               英文头衔
         </td>
         <td class="answer">
           ran  fuck sky
         </td>  
      </tr> 
        <tr>
         <td class="attributes">
              单位名称
         </td>
         <td class="answer"colspan="2">
               加州大学
         </td>  
          <td class="attributes">
               单位地址
         </td>
         <td class="answer"colspan="2">
               东经XX度，北纬XX度
         </td>  
      </tr>
       <tr>
         <td class="attributes">
              邀请函原件
         </td>
         <td class="answer"colspan="5">
               <a>超链接在此</a>
         </td>         
      </tr>
       <tr>
         <td class="attributes">
         邀请函中文翻译件
         </td>
         <td class="answer"colspan="5">
               <a>超链接在此</a>
         </td>         
      </tr>
    </tbody>
         <thead>
      <tr>
          <th colspan="6" class="head">
                  费用负担情况
          </th>
    </tr>
     </thead>
     <tbody>
     <tr>
         <td class="attributes"colspan="2">
              邀请方负担情况
         </td>
        <td class="answer"colspan="4">
           部分负担  (控制)
         </td>   
     </tr>
        <tr>
         <td class="attributes"colspan="2">
             部分负担费用
         </td>
        <td class="answer"colspan="2">
          其他
         </td>   
         <td class="answer"colspan="2">
           选择其他时再次说明
         </td>   
     </tr>
     <tr>
     <td rowspan="4" colspan="2" class="attributes">
        我方负担情况
     </td>
     <td class="attributes">
        负担费用
     </td>
     <td class="attributes">
        经费类型
     </td>
       <td class="attributes" colspan="2">
      备注
     </td>
     <tr>
     <td class="answer">
       100000
     </td>
     <td class="answer">
      住宿费
     </td>
       <td class="answer" colspan="2">
      无
     </td>
     </tr>
       <tr>
     <td class="answer">
       8000
     </td>
     <td class="answer">
      伙食费
     </td>
       <td class="answer" colspan="2">
      无
     </td>
     </tr>
       <tr>
     <td class="answer">
       200000
     </td>
     <td class="answer">
      奖金
     </td>
       <td class="answer" colspan="2">
      获奖才有
     </td>
     </tr>
     
     <tr>
     <td rowspan="2" colspan="2" class="attributes">
      其他出资方
     </td>
     <td class="attributes">
     资助范围
     </td>
     <td class="answer"colspan="3">
       不限
     </td>
    </tr>
     <tr>
     <td class="attributes">
        证明文件
     </td>
     <td class="answer"colspan="3">
      <a>超链接在此</a>
     </td>
     </tr>
     </tbody>
      </table>
   
   <div id="btn">
   <div id="btn1" >
   <input type="button" class="btn btn-primary" value="确认">
   </div>
   <div id="btn2">
   <input  type="button" class="btn btn-primary" value="返回">
   </div>
   </div>
   
   </div>
   
   
   
   
  </body>
</html>
