package com.himedia.tp01.service;

import com.himedia.tp01.dao.IMemberDao;
import com.himedia.tp01.dto.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    IMemberDao mdao;

    public MemberVO getMember(String userid) {
        return mdao.getMember(userid);
    }

    public void insertMember(MemberVO mvo) {
        mdao.insertMember(mvo);
    }

    public void updateMember(MemberVO mvo) {
        mdao.updateMember(mvo);
    }

    /* 현재 로그인한 유저에게 planCode 부여 */
    public void updateMemberPlanCode(String userid, String planCode) {
        mdao.updateMemberPlanCode(userid, planCode);
    }

    public void deleteMember(String userid) {
        mdao.deleteMember(userid);
    }

    public String findIdByNameAndEmail(String name, String email) {
        return mdao.findIdByNameAndEmail(name, email);
    }

    public String findPasswordByIdAndEmail(String userid, String email) {return mdao.findPasswordByIdAndEmail(userid, email);
    }

    public void updatePassword(String userid, String newPassword) {mdao.updatePassword(userid,newPassword);
    }
}

