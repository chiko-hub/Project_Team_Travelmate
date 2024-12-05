package com.himedia.tp01.controller;

import com.himedia.tp01.dto.MemberVO;
import com.himedia.tp01.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@Controller
public class MemberController {

    @Autowired
    MemberService ms;

    @GetMapping("/loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("dto")
                            @Valid MemberVO membervo, BindingResult result,
                            Model model, HttpServletRequest request){
        String url = "member/loginForm";
        if( result.getFieldError("userid")!=null)
            model.addAttribute("message", "아이디를 입력하세요");
        else if( result.getFieldError("pwd")!=null)
            model.addAttribute("message", "패스워드를 입력하세요");
        else{
            MemberVO mvo = ms.getMember( membervo.getUserid() );
            if( mvo == null )
                model.addAttribute("message", "아이디/비번을 확인하세요");
            else if( !mvo.getPwd().equals( membervo.getPwd() ) )
                model.addAttribute("message", "아이디/비번을 확인하세요");
            else if( mvo.getPwd().equals( membervo.getPwd() ) ){
                HttpSession session = request.getSession();
                session.setAttribute("loginUser", mvo);
                url = "redirect:/";
            }
        }
        return url;
    }

    @PostMapping("/mypage")
    public String mypage(Model model) {
        return "member/joinForm";
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginUser");
        return "redirect:/";
    }

    @GetMapping("/contract")
    public String contract(Model model) {
        return "member/contract";
    }

    @GetMapping("/joinForm")
    public String joinForm(Model model) {
        return "member/joinForm";
    }

    @PostMapping("/idcheck")
    @ResponseBody
    public HashMap<String, Object> idcheck(@RequestParam("userid") String userid) {
        MemberVO mvo = ms.getMember( userid );
        HashMap<String, Object> result = new HashMap<>();
        if( mvo == null ){
            result.put("idmessage", 1);
            result.put("userid", userid);
        }else{
            result.put("idmessage", -1);
        }
        return result;
    }

    @PostMapping("/join")
    public String join(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, Model model,
                       @RequestParam(value="reid", required = false) String reid,
                       @RequestParam(value="pwdCheck", required = false) String pwdCheck ) {
        String url = "member/joinForm";
        model.addAttribute("reid", reid);
        if( result.getFieldError("userid")!=null )
            model.addAttribute("validmsg", "아이디를 입력하세요");
        else if( result.getFieldError("pwd")!=null )
            model.addAttribute("validmsg", "비밀번호를 입력하세요");
        else if( result.getFieldError("name")!=null )
            model.addAttribute("validmsg", "이름을 입력하세요");
        else if( result.getFieldError("email")!=null )
            model.addAttribute("validmsg", "이메일을 입력하세요");
        else if( result.getFieldError("phone")!=null )
            model.addAttribute("validmsg", "전화번호를 입력하세요");
        else if( !membervo.getUserid().equals(reid) )
            model.addAttribute("validmsg", "아이디 중복검사를 실행하세요");
        else if( !membervo.getPwd().equals(pwdCheck) )
            model.addAttribute("validmsg", "비밀번호 확인이 일치하지 않습니다");
        else{
            url = "member/loginForm";
            model.addAttribute("message", "회원가입이 완료되었습니다. 로그인하세요");
            membervo.setProvider("default");
            ms.insertMember( membervo );
        }
        return url;
    }









}
