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
        <div class="panel panel-default">
            <div class="panel-body">

                <h1 class="text-center">515技术问答</h1>

                <br>
<#--                <div class="row">-->
<#--                    <div class="col-xs-12 col-sm-10 col-md-6 col-sm-offset-1 col-md-offset-3">-->
<#--                        <form id="form_search" action="/community/search/1/" method="get">-->
<#--                            <input type='hidden' name='csrfmiddlewaretoken' value='jWQe9e7FjQTx2r3LppHfoFveM6GKKgyZLkWFiVLkKP4LQX71CY0AUm6j0soMgEX7'>-->
<#--                            <div class="input-group">-->
<#--                                <input type="text" name="search_content" class="form-control" placeholder="搜索作者、关键字、搜索标题、问题内容" style="border-radius: 5px;" maxlength="200">-->
<#--                                <span class="input-group-btn">-->
<#--                                <button class="btn btn-link" type="submit" style="border-radius: 5px;">-->
<#--                                    &nbsp;&nbsp;<span class="glyphicon glyphicon-search" style="font-size: 17px;"></span>-->
<#--                                </button>-->
<#--                              </span>-->
<#--                            </div>-->
<#--                        </form>-->
<#--                    </div>-->
<#--                </div>-->

                <div class="text-right">
                    <#if !logininfo??>
                        <a href="#"
                           class="btn btn-info btn-index btn-lg"
                           data-toggle="modal" data-target="#login-modal">
                            提问&nbsp;
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
                    <#else>
                        <a href="/addCommunity.do?${logininfo.id}" class="btn btn-info btn-index btn-lg">
                            提问&nbsp;
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
                    </#if>
                </div>

                <hr>

                <#list communityList.list as community>
                    <div class="row">
                        <div class="col-xs-12 col-sm-3 col-md-2" align="center">
                            <div class="row hidden-xs">
                                <div class="col-xs-1 col-sm-4 count_number">
                                    <div class="row">
                                        <div class="col-xs-1 col-md-12 count_number">
                                            ${community.voteSize}
                                        </div>
                                        <div class="col-xs-1 col-md-12 count_description">
                                            支持
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-1 col-sm-4 count_number">
                                    <div class="row <#if community.solve == 1> vote_accept</#if>">
                                        <div class="col-xs-1 col-md-12 count_number
                                            <#if community.solve == 1> vote_accept_text</#if>">
                                            ${community.answerSize}
                                        </div>
                                        <div class="col-xs-1 col-md-12 count_description
                                            <#if community.solve == 1> vote_accept_text</#if>">
                                            回答
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-1 col-sm-4 count_number">
                                    <div class="row">
                                        <div class="col-xs-1 col-md-12 count_number">
                                            ${community.readSize}
                                        </div>
                                        <div class="col-xs-1 col-md-12 count_description">
                                            浏览
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <ul class="visible-xs list-inline pull-left">
                                <li class="count_number">
                                    <span style="font-size: 15px; font-weight: bold;">${community.voteSize}</span>
                                    <span style="font-size: 12px;">支持</span>
                                </li>
                                <li class="count_number">
                                    <span style="font-size: 15px; font-weight: bold;">${community.answerSize}</span>
                                    <span style="font-size: 12px;">回答</span>
                                </li>
                                <li class="count_number">
                                    <span style="font-size: 15px; font-weight: bold;">${community.readSize}</span>
                                    <span style="font-size: 12px;">浏览</span>
                                </li>
                            </ul>
                        </div>
                        <div class="col-xs-12 col-sm-9 col-md-10">
                            <div class="row">
                                <div class="col-xs-12">
                                    <a class="community_question_title" href="/communityContent.do?id=${community.id}">
                                        ${community.title}
                                    </a>
                                </div>
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6">
                                            <span class="label label-default community_question_keywords"></span>
                                        </div>
                                        <div class="col-xs-6 col-sm-6" align="right">
                                            <a class="community_question_author" href="/userspace.do?id=${community.asker.id}">
                                                ${community.asker.username}
                                            </a>
                                            问于
                                            <span title="${community.createTime?string('yyyy-MM-dd hh:mm:ss')}">
                                                ${community.createTime?string('yyyy-MM-dd hh:mm:ss')}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                </#list>

                <div align="right">
                    <ul class="pagination">
                        <li><a name="page_turning" id="page_${1}"
                               href="/community.do?pageNum=${1}">&laquo;</a></li>
                        <#if communityList.pages gt 4 && communityList.pageNum gt 4>
                            <#list communityList.navigatepageNums as num>
                                <#if (num - communityList.pageNum > -4 && num - communityList.pageNum <= 1)
                                || (communityList.hasNextPage == false && num - communityList.pageNum > -5)>
                                    <li <#if num == communityList.pageNum>class="active"</#if>>
                                        <a name="page_turning" id="page_${num}" href="/community.do?pageNum=${num}">
                                            ${num}
                                        </a>
                                    </li>
                                </#if>
                            </#list>
                        <#else>
                            <#list communityList.navigatepageNums as num>
                                <#if num <= 5>
                                    <li <#if num == communityList.pageNum>class="active"</#if>>
                                        <a name="page_turning" id="page_${num}" href="/community.do?pageNum=${num}">
                                            ${num}
                                        </a>
                                    </li>
                                </#if>
                            </#list>
                        </#if>
                        <li><a name="page_turning" id="page_${communityList.pageSize}"
                               href="/community.do?pageNum=${communityList.pages}">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>
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
</body>
</html>