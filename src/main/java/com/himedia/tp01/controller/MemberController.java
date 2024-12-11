package com.himedia.tp01.controller;

import com.google.gson.Gson;
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
import org.springframework.web.servlet.ModelAndView;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
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
            model.addAttribute("message", "회원가입이 완료되었습니다.&nbsp;&nbsp;&nbsp; 로그인하세요");
            membervo.setProvider("default");
            ms.insertMember( membervo );
        }
        return url;
    }

    @GetMapping("/index")
    public String index(Model model) {return "index";}

    @GetMapping("/updateMemberForm")
    public ModelAndView updateMemberForm(HttpServletRequest request, Model model ) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();
        MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
        mav.setViewName("member/mypage");
        mav.addObject("dto", loginUser);
        return mav;
    }

    @PostMapping("/updateMember")
    public String updateMember(  //modelandview로 바꾸기
            @ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result,
            @RequestParam(value="pwdCheck", required = false) String pwdCheck,
            HttpServletRequest request, Model model){
        String url = "member/mypage";
        if( result.getFieldError("userid")!=null )
            model.addAttribute("msg", "아이디를 입력하세요");
        else if( result.getFieldError("pwd")!=null )
            model.addAttribute("msg", "비밀번호를 입력하세요");
        else if( result.getFieldError("name")!=null )
            model.addAttribute("msg", "이름을 입력하세요");
        else if( result.getFieldError("email")!=null )
            model.addAttribute("msg", "이메일을 입력하세요");
        else if( result.getFieldError("phone")!=null )
            model.addAttribute("msg", "전화번호를 입력하세요");
        else if( pwdCheck == null || !membervo.getPwd().equals(pwdCheck) )
            model.addAttribute("msg", "비밀번호 확인이 일치하지 않습니다");
        else{
            ms.updateMember(membervo);
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", membervo);
            model.addAttribute("msg", "회원수정 완료되었습니다.");
        }
        return url;
    }

    @GetMapping("/customerForm")
    public String customerForm() {return "member/customerForm";}


    @GetMapping("/kakaostart")
    public  @ResponseBody String kakaostart() {
        String a = "<script type='text/javascript'>" +
                "location.href='https://kauth.kakao.com/oauth/authorize?"
                + "client_id=b3c7d7ff063b8695734129d2eb5881e6"
                + "&redirect_uri=http://localhost:8070/kakaoLogin"
                + "&response_type=code'"
                + "</script>";
        return a;
    }

}
