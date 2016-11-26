package com.prabhsingh.controller;

import com.prabhsingh.beans.Article;
import com.prabhsingh.beans.CustomUserDetailsService;
import com.prabhsingh.beans.User;
import com.prabhsingh.beans.UserRole;
import com.prabhsingh.dao.DAO;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.LocalDate;

/**
 * Created by prabh on 2016-11-24.
 */
@Controller
public class HomeController {

    DAO d = new DAO();


    @RequestMapping(value = "/")
    public String home(Model model) {
        model.addAttribute("articleList", d.getArticles());
        return "index";
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String addNewArticle(Model model) {
        model.addAttribute("article", new Article());
        return "edit";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String editArticle(Model model, @PathVariable int id) {
        model.addAttribute("article", d.getArticle(id));
        return "edit";
    }

    @RequestMapping(value = "view/{id}", method = RequestMethod.GET)
    public String viewArticle(Model model, @PathVariable int id) {
        model.addAttribute("article", d.getArticle(id));
        return "view";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String saveArticle(Model model, @ModelAttribute Article article, Principal principal) {
        article.setLastModifiedDate(LocalDate.now());
        article.setUser(principal.getName());
        d.saveArticle(article);
        model.addAttribute("article", d.getArticle((article.getId())));
        return "view";
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String deleteArticle(Model model, @PathVariable int id) {
        d.deleteArticle(id);
        model.addAttribute("articleList", d.getArticles());
        return "index";
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping("/register")
    public String register(Model model, @RequestParam String username, @RequestParam String password) {

        String encryptedPassword = new BCryptPasswordEncoder().encode(password);
        User user = new User(username, encryptedPassword, true);

        UserRole userRole = new UserRole(user, "ROLE_USER");
        user.getUserRole().add(userRole);

        DAO dao = new DAO();
        dao.createUser(user);

        UserDetails userDetails = new CustomUserDetailsService().loadUserByUsername(username);
        UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(userDetails, encryptedPassword, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
        return "index";
    }
}
