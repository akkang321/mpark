<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://accounts.google.com/gsi/client" async defer></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 

<script>

        window.onload = async () => {
            GetPartners('DEFAULT');
        }

        // 모든 파트너사의 정보를 가져온다.
        // Search 빈값일 때 Partners 함수 호출
        $('#PartnersName').keyup(function (e) {
            if ($(this).val() == "") {
                GetPartners('DEFAULT');
            }
        });
        // Search Enter
        $('#PartnersName').keydown(function (e) {
            if (e.keyCode == 13) GetPartners($('#PartnersName').val());
        })
        let AllPartners = [];
        async function GetPartners(Keyword) {

            let headers = {};
            headers['Authorization'] = `Bearer ${localStorage.getItem('MyIDT')}`;
            // headers['Authorization'] = `Bearer ${Authorization}`;

            var params =
                Keyword == 'DEFAULT' ? {
                    Mode: "DEFAULT"
                } : {
                    Mode: "KEYWORD",
                    Keyword: `${Keyword}`
                }
            let Result = null;
            try {
                Result = await fetch(`${Api}/GetPartners`, {
                    method: 'POST',
                    headers: headers,
                    body: JSON.stringify(params)
                });
            } catch (error) {
                console.log(error);
                return;
            }
            if (!Result.ok) {
                alert('ERROR');
                SetNewIDT();
                console.log(Result.status);
                return;
            }
            Result.json().then(
                Data => {

                    // 기본 Array와 생성된 HTMl 초기화
                    AllPartners = [];
                    document.getElementById('AllPartnersTbody').innerHTML = AllPartners;

                    if (Data['Results'].length == 0) {
                        $('.PartnersEmpty').removeClass('hide');
                        return;
                    } else {
                        $('.PartnersEmpty').addClass('hide');
                    }
                    for (i = 0; i < Data['Results'].length; i++) {
                        AllPartners.push(Data['Results'][i]);
                        console.log(AllPartners[i]);
                        document.getElementById('AllPartnersTbody').innerHTML += `
                        <tr onclick="window.location.href = 'PartnersDetail_1.html?PartnerBN=${AllPartners[i]['PartnerBN']}';">
                            <td>${AllPartners[i]['PartnerName']}</td>
                            <td>${AllPartners[i]['PhoneNumber']}</td>
                            <td>${AllPartners[i]['OwnerEmail']}</td>
                            <td>${AllPartners[i]['PartnerBN']}</td>
                            <td>${AllPartners[i]['OwnerName']}</td>
                        </tr>
                        `
                    }
                }
            )
        } 

</script> 


<form id="frm"> 

    <div class="PartnersWrap">
    	<div class="searchBox">
        	<input type="text" id="PartnersName" placeholder="파트너스명 검색">
                <button onclick="GetPartners($('#PartnersName').val());">검색</button>
        </div>
	
	<table>

		<thead>
			<tr>
				<td>파트너스 명</td>
				<td>전화번호</td>
				<td>E-Mail</td>
				<td>사업자 번호</td>
				<td style="width: 400px;">파트너스 대표자 명</td>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td>미팍1호점</td>
				<td>010-1234-5678</td>
				<td>me.park@gmail.com</td>
				<td>15154815-564415</td>
				<td>이지섭</td>
			</tr>
		</tbody>

		<tbody>
			<tr>
				<td>미팍1호점</td>
				<td>010-1234-5678</td>
				<td>me.park@gmail.com</td>
				<td>15154815-564415</td>
				<td>이지섭</td>
			</tr>
		</tbody>

	</table>

	</div>

</form>


