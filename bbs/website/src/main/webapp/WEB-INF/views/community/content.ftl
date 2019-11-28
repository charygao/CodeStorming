<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>问答-515lab</title>
    <#include "../common/links-tpl.ftl" />
</head>
<body id="acwing_body">

<!-- 网页导航 -->
<#include "../common/navbar-tpl.ftl" />


<div class="base_body">

    <div class="container">
        <div class="row">
            <div class="col-xs-offset-0 col-xs-12 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-9">

                <div class="panel panel-default copy-with-link">
                    <div class="panel-body">


                        <h2 class="nice_font" style="font-weight: normal;">
                            ${community.title}
                        </h2>
                        <div align="right">

                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-xs-1 vote_cut" align="center">

                                <a href='#' data-toggle="modal" data-target="#login-modal"><span
                                            class="glyphicon glyphicon-triangle-top vote "></span></a>
                                <br>
                                <span class="votecnt">${community.voteSize}</span>
                                <br>
                                <a href='#' data-toggle="modal" data-target="#login-modal">
                                    <span class="glyphicon glyphicon-triangle-bottom vote "></span>
                                </a>
                                <br>
                                <a href='#' data-toggle="modal" data-target="#login-modal"><span
                                            class="glyphicon glyphicon-star vote"></span></a>
                                <br>
                                <span class="favoritecnt"></span>

                            </div>
                            <div class="col-xs-11 vote_cut">
                                <div class="main-martor main-martor-content" data-field-name="content">
                                    <div class="section-martor">
                                        <div class="ui bottom attached tab active martor-preview">
                                            <p>${community.content}</p>
                                            <span class="label label-default community_question_keywords"></span>
                                            <br><br>
                                            <div align="right">
                                                <div class="information_card" align="left">
                                                    <span class="datetime"
                                                          title="${community.createTime?string('yyyy-MM-dd hh:mm:ss')}">
                                                        提问于${community.createTime?string('yyyy-MM-dd hh:mm:ss')}
                                                    </span>
                                                    <div class="row">
                                                        <div class="col-xs-4" style="padding-right:0;">
                                                            <a href="/userspace.do?id=${community.asker.id}">
                                                                <img class="img photo" src="${community.asker.avatar}"
                                                                     width="40px" height="40px">
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-8" style="padding-left:0;">
                                                            <div style="height: 13px; line-height: 1;">
                                                                <a href="/userspace.do?id=${community.asker.id}">
                                                                <span class="nice_font" title="${community.asker.username}"
                                                                      style="font-size: 16px;">
                                                                    ${community.asker.username}
                                                                </span>
                                                                </a>
                                                            </div>
                                                            <div style="height: 13px; margin-top: 8px;" title="声望值">
                                                                <span class="glyphicon glyphicon-star"
                                                                      style="color: #f5d500; font-size: 14px;"></span>
                                                                <span style="font-size: 14px; font-weight: bold; color: #6a737c">${community.asker.visitors}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div><!-- end  /.section-martor -->
                                </div>
                            </div>

                            <div class="col-xs-offset-1 col-xs-11">
                                <div class="comment_field">

                                    <button class="add_a_comment btn btn-link" title="询问更详细的信息或提供建议，请不要在这里回答问题"
                                            data-toggle="modal" data-target="#login-modal">
                                        发表评论
                                    </button>

                                </div>
                            </div>
                        </div>
                        <br><br>
                        <p class="nice_font answer_title">
                            ${community.answerSize}
                            个问答
                        </p>
                        <hr>
                        <#list community.answers as answer>
                            <div class="row answer_field" id="answer_666">
                                <div class="col-xs-1 vote_cut" align="center">

                                    <a href='#' data-toggle="modal" data-target="#login-modal">
                                        <span class="glyphicon glyphicon-triangle-top vote "></span>
                                    </a>
                                    <br>
                                    <span class="votecnt">${answer.voteSize}</span>
                                    <br>
                                    <a href='#' data-toggle="modal" data-target="#login-modal">
                                        <span class="glyphicon glyphicon-triangle-bottom vote "></span>
                                    </a>
                                    <br>
                                    <span class="votecnt glyphicon glyphicon-ok " style="color: #5fba7d;"></span>

                                </div>
                                <div class="col-xs-11 vote_cut">
                                    <div class="main-martor main-martor-content" data-field-name="content">
                                        <div class="section-martor">
                                            <div class="ui bottom attached tab active martor-preview"
                                                 data-tab="preview-tab-content">
                                                ${answer.content}
                                                <div align="right">

                                                    <div class="information_card" align="left">
                                                        <span class="datetime"
                                                              title="${answer.createTime?string('yyyy-MM-dd hh:mm:ss')}">
                                                            回答于${answer.createTime?string('yyyy-MM-dd hh:mm:ss')}
                                                        </span>
                                                        <div class="row">
                                                            <div class="col-xs-4" style="padding-right:0;">
                                                                <a href="javascript:;">
                                                                    <img class="img photo"
                                                                         src="${answer.answerUser.avatar}"
                                                                         width="40px" height="40px">
                                                                </a>
                                                            </div>
                                                            <div class="col-xs-8" style="padding-left:0;">
                                                                <div style="height: 13px; line-height: 1;">
                                                                    <a href="javascript:;">
                                                                        <span class="nice_font"
                                                                              title="${answer.answerUser.username}"
                                                                              style="font-size: 16px;">
                                                                            ${answer.answerUser.username}
                                                                        </span>
                                                                    </a>
                                                                </div>
                                                                <div style="height: 13px; margin-top: 8px;" title="声望值">
                                                                    <span class="glyphicon glyphicon-star"
                                                                          style="color: #f5d500; font-size: 14px;"></span>
                                                                    <span style="font-size: 14px; font-weight: bold; color: #6a737c">
                                                                        ${answer.answerUser.visitors}
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                        </div><!-- end  /.section-martor -->
                                    </div>
                                </div>

                                <div class="col-xs-offset-1 col-xs-11">
                                    <div class="comment_field">

                                        <button class="add_a_comment btn btn-link" title="询问更详细的信息或提供建议，请不要在这里回答问题"
                                                data-toggle="modal" data-target="#login-modal">
                                            发表评论
                                        </button>

                                    </div>
                                </div>
                            </div>
                            <hr>
                        </#list>

                        <div class="text-right">
                            <a class="btn btn-default btn-subtitle" data-toggle="modal" data-target="#login-modal">
                                我来回答
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <div id="modal-danger" class="modal modal-message modal-danger fade" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <i class="glyphicon glyphicon-fire"></i>
                </div>
                <div class="modal-body">你确定删除吗？</div>
                <div class="modal-footer">
                    <form id="modal_danger_delete_url" method="post" action="" enctype="multipart/form-data">
                        <input type='hidden' name='csrfmiddlewaretoken'
                               value='WgZu8Z9D8dZre5AzwmxdMqc3YgMukONfoE5VhGNizcaF2BEPJVQyi7N8cCuwQccn'>
                        <button type="button" class="btn" data-dismiss="modal">取消</button>
                        <button id="modal_danger_delete_url_btn" class="btn btn-danger" data-dismiss="modal"
                                type="submit">
                            删除
                        </button>
                    </form>
                </div>
            </div> <!-- / .modal-content -->
        </div> <!-- / .modal-dialog -->
    </div>
</div>


<div id="modal-warning" class="modal modal-message modal-warning fade" style="display: none;" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <i class="glyphicon glyphicon-warning-sign"></i>
            </div>
            <div id="warning_message_content" class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">OK</button>
            </div>
        </div> <!-- / .modal-content -->
    </div> <!-- / .modal-dialog -->
</div>

<#include "../common/footer-tpl.ftl" />
<#include "../common/scripts-tpl.ftl" />
<script src="static/editor.md/lib/marked.min.js"></script>
<script src="static/editor.md/lib/prettify.min.js"></script>
<script src="static/editor.md/lib/raphael.min.js"></script>
<script src="static/editor.md/lib/underscore.min.js"></script>
<script src="static/editor.md/lib/sequence-diagram.min.js"></script>
<script src="static/editor.md/lib/flowchart.min.js"></script>
<script src="static/editor.md/lib/jquery.flowchart.min.js"></script>
<script src="static/editor.md/editormd.min.js"></script>
<script type="text/javascript">
    testEditormdView2 = editormd.markdownToHTML("test-editormd-view", {
        htmlDecode      : "style,script,iframe",  // you can filter tags decode
        emoji           : true,
        taskList        : true,
        tex             : true,  // 默认不解析
        flowChart       : true,  // 默认不解析
        sequenceDiagram : true,  // 默认不解析
    });
</script>
</body>
</html>