package com.test.Repository;

import com.test.Domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

	// username 조회
	Optional<Member> findByusername(String username);
}
