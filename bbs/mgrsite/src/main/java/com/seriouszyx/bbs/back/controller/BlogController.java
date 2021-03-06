package com.seriouszyx.bbs.back.controller;

import com.seriouszyx.bbs.base.domain.Blog;
import com.seriouszyx.bbs.base.domain.BlogComment;
import com.seriouszyx.bbs.base.domain.mgr.MgrBlogComment;
import com.seriouszyx.bbs.base.service.IBlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BlogController {

    @Autowired
    private IBlogService blogService;

    private Map<String, Object> result = new HashMap<>();

    @RequestMapping("toBlogMgr")
    public String toBlogMgr(Model model) {
        List<Blog> blogs = blogService.listAll();
        model.addAttribute("blogList", blogs);
        return "blog/list";
    }

    @RequestMapping("blogItemEdit")
    @ResponseBody
    public Map<String, Object> blogItemEdit(Long id) {
        Blog blog = blogService.listById(id);
        result.put("title", blog.getTitle());
        result.put("weight", blog.getWeight());
        result.put("type", blog.getBlogType());
        return result;
    }

    @RequestMapping("blogItemUpdate")
    @ResponseBody
    public Map<String, Object> blogItemUpdate(Blog blog) {
        blogService.updateBlog(blog);
        return result;
    }

    @RequestMapping("blogItemRemove")
    @ResponseBody
    public Map<String, Object> blogItemRemove() {
        return result;
    }

    @RequestMapping("blogItemDelete")
    @ResponseBody
    public Map<String, Object> blogItemDelete(Long id) {
        blogService.removeBlogByPrimaryKey(id);
        return result;
    }

    @RequestMapping("toBlogCommentMgr")
    public String toBlogCommentMgr(Model model) {
        List<MgrBlogComment> blogComments = blogService.listComments();
        model.addAttribute("blogCommentList", blogComments);
        return "blog/comment-list";
    }

    @RequestMapping("blogCommentItemEdit")
    @ResponseBody
    public Map<String, Object> blogCommentItemEdit(Long id) {
        BlogComment blogComment = blogService.listByCommentId(id);
        result.put("content", blogComment.getCommentContent());
        return result;
    }

    @RequestMapping("blogCommentItemUpdate")
    @ResponseBody
    public Map<String, Object> blogCommentItemUpdate(BlogComment blogComment) {
        blogService.updateBlogComment(blogComment);
        return result;
    }

    @RequestMapping("blogCommentItemRemove")
    @ResponseBody
    public Map<String, Object> blogCommentItemRemove() {
        return result;
    }

    @RequestMapping("blogCommentItemDelete")
    @ResponseBody
    public Map<String, Object> blogCommentItemDelete(Long id) {
        blogService.deleteBlogComment(id);
        return result;
    }

}
