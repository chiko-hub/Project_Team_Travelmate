package com.himedia.tp01.controller;

import com.google.gson.Gson;
import com.himedia.tp01.dto.KakaoProfile;
import com.himedia.tp01.dto.MemberVO;
import com.himedia.tp01.dto.OAuthToken;
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
                        Model model, HttpServletRequest request) {
        String url = "member/loginForm";
        if (result.getFieldError("userid") != null)
            model.addAttribute("message", "아이디를 입력하세요");
        else if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "패스워드를 입력하세요");
        else {
            MemberVO mvo = ms.getMember(membervo.getUserid());
            if (mvo == null)
                model.addAttribute("message", "아이디/비번을 확인하세요");
            else if (!mvo.getPwd().equals(membervo.getPwd()))
                model.addAttribute("message", "아이디/비번을 확인하세요");
            else if (mvo.getPwd().equals(membervo.getPwd())) {
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
        MemberVO mvo = ms.getMember(userid);
        HashMap<String, Object> result = new HashMap<>();
        if (mvo == null) {
            result.put("idmessage", 1);
            result.put("userid", userid);
        } else {
            result.put("idmessage", -1);
        }
        return result;
    }


    @PostMapping("/join")
    public String join(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, Model model,
                       @RequestParam(value = "reid", required = false) String reid,
                       @RequestParam(value = "pwdCheck", required = false) String pwdCheck) {
        String url = "member/joinForm";
        model.addAttribute("reid", reid);
        if (result.getFieldError("userid") != null)
            model.addAttribute("validmsg", "아이디를 입력하세요");
        else if (result.getFieldError("pwd") != null)
            model.addAttribute("validmsg", "비밀번호를 입력하세요");
        else if (result.getFieldError("name") != null)
            model.addAttribute("validmsg", "이름을 입력하세요");
        else if (result.getFieldError("email") != null)
            model.addAttribute("validmsg", "이메일을 입력하세요");
        else if (result.getFieldError("phone") != null)
            model.addAttribute("validmsg", "전화번호를 입력하세요");
        else if (!membervo.getUserid().equals(reid))
            model.addAttribute("validmsg", "아이디 중복검사를 실행하세요");
        else if (!membervo.getPwd().equals(pwdCheck))
            model.addAttribute("validmsg", "비밀번호 확인이 일치하지 않습니다");
        else {
            url = "member/loginForm";
            model.addAttribute("message", "회원가입이 완료되었습니다.&nbsp;&nbsp;&nbsp; 로그인하세요");
            membervo.setProvider("default");
            ms.insertMember(membervo);
        }
        return url;
    }

    @GetMapping("/index")
    public String index(Model model) {
        return "index";
    }

    @GetMapping("/updateMemberForm")
    public ModelAndView updateMemberForm(HttpServletRequest request, Model model) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        mav.setViewName("member/mypage");
        mav.addObject("dto", loginUser);
        return mav;
    }

    @PostMapping("/updateMember")
    public String updateMember(  //modelandview로 바꾸기
                                 @ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result,
                                 @RequestParam(value = "pwdCheck", required = false) String pwdCheck,
                                 HttpServletRequest request, Model model) {
        String url = "member/mypage";
        if (result.getFieldError("userid") != null)
            model.addAttribute("msg", "아이디를 입력하세요");
        else if (result.getFieldError("pwd") != null)
            model.addAttribute("msg", "비밀번호를 입력하세요");
        else if (result.getFieldError("name") != null)
            model.addAttribute("msg", "이름을 입력하세요");
        else if (result.getFieldError("email") != null)
            model.addAttribute("msg", "이메일을 입력하세요");
        else if (result.getFieldError("phone") != null)
            model.addAttribute("msg", "전화번호를 입력하세요");
        else if (pwdCheck == null || !membervo.getPwd().equals(pwdCheck))
            model.addAttribute("msg", "비밀번호 확인이 일치하지 않습니다");
        else {
            ms.updateMember(membervo);
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", membervo);
            model.addAttribute("msg", "회원수정 완료되었습니다.");
        }
        return url;
    }

    @GetMapping("/customerForm")
    public String customerForm() {
        return "member/customerForm";
    }


    @GetMapping("/kakaostart")
    public  @ResponseBody String kakaostart() {
        String a = "<script type='text/javascript'>" +
                "location.href='https://kauth.kakao.com/oauth/authorize?"
                + "client_id=02de0c6cb8a5f7f7b14fe2e506419a84"
                + "&redirect_uri=http://localhost:8070/kakaoLogin"
                + "&response_type=code'"
                //"alert('카카오로 이동합니다');" +
                + "</script>";

        return a;
    }


    @GetMapping("/kakaoLogin")
    public String loginkakao( @RequestParam("code") String code,
                              HttpServletRequest request) throws IOException {
        System.out.println("1차 수신 코드 : " + code);  // 앱키를 이용한 최초 인증 수신 코드

        // 개인정보 요청을 위한 1차 토큰을 요청합니다
        // 요청할 url 과 전달인수 설정
        String endpoint="https://kauth.kakao.com/oauth/token";
        URL url =new URL(endpoint);

        String bodyData="grant_type=authorization_code";
        bodyData += "&client_id=02de0c6cb8a5f7f7b14fe2e506419a84";
        bodyData += "&redirect_uri=http://localhost:8070/kakaoLogin";
        bodyData += "&code="+code;

        // url  객체에 bodyData 를 더해서 요청합니다

        //Stream 연결  // import - java.net.HttpURLConnection;
        HttpURLConnection conn=(HttpURLConnection)url.openConnection();
        //http header 값 넣기(요청 내용에 헤더 추가)
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        conn.setDoOutput(true);  // 송신설정
        BufferedWriter bw=new BufferedWriter(
                new OutputStreamWriter(conn.getOutputStream(),"UTF-8")
        );
        bw.write(bodyData);
        bw.flush();  // 실제송신 시점

        // 요청에 의한 수신 객체 생성
        BufferedReader br = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), "UTF-8")
        );
        String input="";
        StringBuilder sb=new StringBuilder();  // 조각난 String 을 조립하기위한 객체
        while((input=br.readLine())!=null){  // 응답 수신
            sb.append(input);      // 수신 내용의 누적
            System.out.println(input);   // 수신 내용을 그때 그때 출력
        }

        // 사용자 정보를 요청하기위한 2차 수신 내용(토큰) {"access_token":"DmnqjJXwB2vMxC7GDEPkXoSH7VtgmQmAAAAAAQopyNoAAAGTTDxEtQGXonZVdqHq","token_type":"bearer","refresh_token":"aG-j8VkdWJzCKp7r_Q4PqBtiNqdUOO0QAAAAAgopyNoAAAGTTDxEsQGXonZVdqHq","expires_in":21599,"scope":"account_email profile_nickname","refresh_token_expires_in":5183999}

        Gson gson=new Gson();
        // sb -> oAuthToken  복사
        OAuthToken oAuthToken = gson.fromJson(sb.toString(), OAuthToken.class);
        System.out.println(oAuthToken.getAccess_token());
        System.out.println(oAuthToken.getRefresh_token());
        System.out.println(oAuthToken.getScope());
        System.out.println(oAuthToken.getExpires_in());

        System.out.println();
        endpoint="https://kapi.kakao.com/v2/user/me";
        url =new URL(endpoint);
        conn=(HttpsURLConnection)url.openConnection();
        conn.setRequestProperty("Authorization", "Bearer "+oAuthToken.getAccess_token());
        conn.setDoOutput(true);
        br=new BufferedReader(
                new InputStreamReader(conn.getInputStream(),"UTF-8")
        );
        input="";
        sb=new StringBuilder();
        while((input=br.readLine())!=null) {
            sb.append(input);
            System.out.println(input);
        }
        // {"id":2844973154,"connected_at":"2023-06-15T12:52:20Z","properties":{"nickname":"강희준"},"kakao_account":{"profile_nickname_needs_agreement":false,"profile":{"nickname":"강희준","is_default_nickname":false},"has_email":true,"email_needs_agreement":false,"is_email_valid":true,"is_email_verified":true,"email":"heejoon73@daum.net"}}

        gson=new Gson();
        KakaoProfile kakaoProfile=gson.fromJson(sb.toString(), KakaoProfile.class);

        System.out.println("id : " + kakaoProfile.getId());

        KakaoProfile.KakaoAccount ac = kakaoProfile.getAccount();
        //System.out.println( "email : " + ac.getEmail() );

        KakaoProfile.KakaoAccount.Profile pf = ac.getProfile();
        System.out.println( "nickname : " + pf.getNickname() );


        // 회원 가입 여부 조회
        MemberVO mdto = ms.getMember( kakaoProfile.getId() );
        // 조회결과 회원이 존재하면 세션에  mdto 를 저장하고  main 으로 이동
        // 회원이 없으면 회원 가입하고 이동
        if( mdto == null ){
            mdto = new MemberVO();
            mdto.setUserid( kakaoProfile.getId() );
            mdto.setName( pf.getNickname()  );
            mdto.setEmail( pf.getNickname() );
            mdto.setProvider("kakao");
            mdto.setPwd("1111");
            mdto.setPhone("1111");
            ms.insertMember( mdto );
        }

        HttpSession session = request.getSession();
        session.setAttribute("loginUser", mdto);
        return "redirect:/index";


    }
}
