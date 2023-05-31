package com.ngmichel.kinefilmsv2.repository;

import com.ngmichel.kinefilmsv2.model.CastMember;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CastMemberRepository extends JpaRepository<CastMember, Long> {
}
