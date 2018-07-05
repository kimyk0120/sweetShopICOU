<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



	<div class="accordion review_list">
		<c:forEach items="${shopReviewList}" var="shopReviewList" varStatus="rl">
			<c:choose>
				<c:when test="${shopReviewList.gradeFirst eq '0' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}"> 
					<c:set var="bg_alpha" value="bg_alpha50" />
				</c:when>
				<c:when test="${shopReviewList.gradeFirst eq '0' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' )}"> 
					<c:set var="bg_alpha" value="bg_alpha55" />
				</c:when>
				<c:when test="${shopReviewList.gradeFirst eq '1' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}"> 
					<c:set var="bg_alpha" value="bg_alpha60" />
				</c:when>
				<c:when test="${shopReviewList.gradeFirst eq '1' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' )}"> 
					<c:set var="bg_alpha" value="bg_alpha65" />
				</c:when>
				<c:when test="${shopReviewList.gradeFirst eq '2' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}"> 
					<c:set var="bg_alpha" value="bg_alpha70" />
				</c:when>
				<c:when test="${shopReviewList.gradeFirst eq '2' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' )}"> 
					<c:set var="bg_alpha" value="bg_alpha75" />
				</c:when>
				<c:when test="${shopReviewList.gradeFirst eq '3' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}"> 
					<c:set var="bg_alpha" value="bg_alpha80" />
				</c:when>
				<c:when test="${shopReviewList.gradeFirst eq '3' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' )}"> 
					<c:set var="bg_alpha" value="bg_alpha85" />
				</c:when>
				<c:when test="${shopReviewList.gradeFirst eq '4' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}"> 
					<c:set var="bg_alpha" value="bg_alpha90" />
				</c:when>
				<c:when test="${shopReviewList.gradeFirst eq '4' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' )}"> 
					<c:set var="bg_alpha" value="bg_alpha95" />
				</c:when>
				<c:when test="${shopReviewList.gradeFirst eq '5' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}"> 
					<c:set var="bg_alpha" value="bg_alpha100" />
				</c:when>
				<c:when test="${shopReviewList.gradeFirst eq '5' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' )}"> 
					<c:set var="bg_alpha" value="bg_alpha100" />
				</c:when>
			</c:choose>

		<ul class="accorion_row" onclick="javascript:listOnOff(this)">
			<li class="${bg_alpha} review_l">
				<div class="list_review_jumsu">
					<ul>
						<li>${shopReviewList.gradeFirst}</li>
						<li>.</li>
						<li>
							<c:if test="${shopReviewList.gradeLast eq '' }">
							0
							</c:if>
							<c:if test="${shopReviewList.gradeLast ne '' }">
							${shopReviewList.gradeLast}
							</c:if>
						</li>
					</ul>
				</div>
				<div class="review_write_info">${shopReviewList.reviewDate}<br />${shopReviewList.writerYear}<br />${shopReviewList.writerGender}</div>
				<div class="review_list_star">
				
					<c:if test="${shopReviewList.gradeFirst eq '0' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}">
					
					</c:if>
					<c:if test="${shopReviewList.gradeFirst eq '0' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' ) }">
					<img src="/src/user/images/common/star_min_white_half.png" />
					</c:if>
					
					<c:if test="${shopReviewList.gradeFirst eq '1' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}">
					<img src="/src/user/images/common/star_min_white.png" />
					</c:if>
					<c:if test="${shopReviewList.gradeFirst eq '1' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' ) }">
					<img src="/src/user/images/common/star_min_white_half.png" /><img src="/src/user/images/common/star_min_white.png" />
					</c:if>

					<c:if test="${shopReviewList.gradeFirst eq '2' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}">
					<img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" />
					</c:if>
					<c:if test="${shopReviewList.gradeFirst eq '2' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' ) }">
					<img src="/src/user/images/common/star_min_white_half.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" />

					</c:if>

					<c:if test="${shopReviewList.gradeFirst eq '3' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}">
					<img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" />
					</c:if>
					<c:if test="${shopReviewList.gradeFirst eq '3' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' ) }">
					<img src="/src/user/images/common/star_min_white_half.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" />
					</c:if>

					<c:if test="${shopReviewList.gradeFirst eq '4' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}">
					<img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" />
					</c:if>
					<c:if test="${shopReviewList.gradeFirst eq '4' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' ) }">
					<img src="/src/user/images/common/star_min_white_half.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" />
					</c:if>

					<c:if test="${shopReviewList.gradeFirst eq '5' and (shopReviewList.gradeLast eq '' or shopReviewList.gradeLast eq '1' or shopReviewList.gradeLast eq '2' or shopReviewList.gradeLast eq '3' or shopReviewList.gradeLast eq '4' )}">
					<img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" />

					</c:if>
					<c:if test="${shopReviewList.gradeFirst eq '5' and (shopReviewList.gradeLast eq '5' or shopReviewList.gradeLast eq '6' or shopReviewList.gradeLast eq '7' or shopReviewList.gradeLast eq '8' or shopReviewList.gradeLast eq '9' ) }">
					<img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" /><img src="/src/user/images/common/star_min_white.png" />
					</c:if>
				
				</div>		

				<div class="list_review_jumsu_plus">
					<ul>
						<li>${shopReviewList.reviewDetail01}<span><strong>${shopReviewList.reviewDetail01Grade}</strong> / 5</span></li>
						<li>${shopReviewList.reviewDetail02}<span><strong>${shopReviewList.reviewDetail02Grade}</strong> / 5</span></li>
						<li>${shopReviewList.reviewDetail03}<span><strong>${shopReviewList.reviewDetail03Grade}</strong> / 5</span></li>
						<li>${shopReviewList.reviewDetail04}<span><strong>${shopReviewList.reviewDetail04Grade}</strong> / 5</span></li>
						<li>${shopReviewList.reviewDetail05}<span><strong>${shopReviewList.reviewDetail05Grade}</strong> / 5</span></li>
						<li>${shopReviewList.reviewDetail06}<span><strong>${shopReviewList.reviewDetail06Grade}</strong> / 5</span></li>
					</ul>
				</div>
				<div class="list_revew_text">${shopReviewList.reviewVisitDate}에<br />${shopReviewList.reviewVisitType}(으)로 방문하셨습니다.</div>

			</li>
			<li class="review_r">
				<a id="btn_review_view">
					<p class="over_1line">${shopReviewList.reviewTitle}</p>
					<span class="over_2line">${shopReviewList.reviewComment} </span>
				</a>
			</li>
		</ul>


		</c:forEach>	
	</div>
		