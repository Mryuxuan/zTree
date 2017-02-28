<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZTree.aspx.cs" Inherits="ZTree.ZTree" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="zTreeStyle.css" rel="stylesheet" />
    <script src="jquery-1.4.4.min.js"></script>
    <script src="jquery.ztree.core.js"></script>
    <script src="jquery.ztree.excheck.js"></script>
    <script type="text/javascript">
        var setting = {
            check: {
                enable: false,
                chkboxType: { "Y": "", "N": "" }
            },
            view: {
                showLine: true,
                expendSpeed: 300,
                dblClickExpand: false
            },
            data: {
                simpleData: {
                    enable: true,
                    idkey: "id",
                    pIdKey: "pId",
                    rootPId: 0
                }
            },
            callback: {
                //beforeClick: beforeClick,
                //onCheck: onCheck
                onClick:onClick
            },
            key: {
                children: "nodes",
                name: "ename",
                title: "fullName"
            }
        };
        function beforeClick(treeId, treeNode) {
            alert("beforeClick");
        }
        function onCheck(e, treeId, treeNode) {
            alert("onCheck");
        }
        var citynodes = [      /**自定义的数据源，ztree支持json,数组，xml等格式的**/
             { id: 0, pId: -1, name: "中国" },
             { id: 1, pId: 0, name: "北京" },
             { id: 2, pId: 0, name: "天津" },
             { id: 3, pId: 0, name: "上海" },
             { id: 6, pId: 0, name: "重庆" },
             { id: 4, pId: 0, name: "河北省", open: false, nocheck: true },
             { id: 41, pId: 4, name: "石家庄" },
             { id: 42, pId: 4, name: "保定" },
             { id: 43, pId: 4, name: "邯郸" },
             { id: 44, pId: 4, name: "承德" },
             { id: 5, pId: 0, name: "广东省", open: false, nocheck: true },
             { id: 51, pId: 5, name: "广州" },
             { id: 52, pId: 5, name: "深圳" },
             { id: 53, pId: 5, name: "东莞" },
             { id: 54, pId: 5, name: "佛山" },
             { id: 6, pId: 0, name: "福建省", open: false, nocheck: true },
             { id: 61, pId: 6, name: "福州" },
             { id: 62, pId: 6, name: "厦门" },
             { id: 63, pId: 6, name: "泉州" },
             { id: 64, pId: 6, name: "三明" },
             { id: 7, pId: 0, name: "四川省", open: true, nocheck: true },
             { id: 71, pId: 7, name: "成都" },
             { id: 72, pId: 7, name: "绵阳" },
             { id: 73, pId: 7, name: "自贡" },
             { id: 711, pId: 71, name: "金牛区" },
             { id: 712, pId: 71, name: "锦江区" },
             { id: 7111, pId: 711, name: "九里堤" },
             { id: 7112, pId: 711, name: "火车北站" }
        ];
        function onClick(e, treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("cityTree");
            zTree.expandNode(treeNode);
        }
        $(document).ready(function () {
            $.fn.zTree.init($("#cityTree"), setting, citynodes);
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul id="cityTree" class="ztree"></ul>
        </div>
    </form>
</body>
</html>
