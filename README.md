# TravelManagement 出入境管理系统
## 源码包结构
***
* __cn.sdu.travel.bean__：model层，各种POJO对象
* __cn.sdu.travel.servlet__：servlet层
* __cn.sdu.travel.utils__：工具包，其中Constants.java存放各种常量数据

## 接口返回数据说明
***
后台接口返回的数据格式统一为json，且json的格式通过bean包下的ReturnRestfulJson.java文件确定。共分为三个部分：  

1. returnCode 返回码，通过int值代表不同的结果信息，从1000开始
2. returnInfo 返回码信息描述
3. data 返回的具体数据，通常也会是一个json字符串

## returnCode码表
***
| returnCode值 | 描述信息 |  
| ------------ | --------------------------------: |  
| 1000         | 上传文件成功                      |  
| 1001         | 上传文件失败                      |  

## 文件上传说明
***
文件上传用统一的接口：__/UploadFile.html__  
文件上传返回数据示例：
```json
{"returnCode":1000,"returnInfo":"文件上传成功","data":"http://localhost:8080/pictures/Jellyfish.jpg"}
{"returnCode":1000,"returnInfo":"文件上传失败","data":"http://localhost:8080/files/pre_fileassoc.tmp"}  
```
