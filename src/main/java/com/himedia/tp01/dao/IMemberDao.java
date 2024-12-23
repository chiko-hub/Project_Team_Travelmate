package com.himedia.tp01.dao;

import com.himedia.tp01.dto.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao {
    MemberVO getMember(String userid);
    void insertMember(MemberVO mvo);
    void updateMember(MemberVO mvo);
    void updateMemberPlanCode(String userid, String planCode); // planCode 부여
    void deleteMember(String userid);
    String findIdByNameAndEmail(String name, String email);
    String findPasswordByIdAndEmail(String userid, String email);

    void updatePassword(String userid, String newPassword);
}
