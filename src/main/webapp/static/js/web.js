const Api = 'https://wi2nmk7hlc.execute-api.ap-northeast-2.amazonaws.com';
// 임시 Authorization
const Authorization = 'eyJhbGciOiJSUzI1NiIsImtpZCI6Ijg2MTY0OWU0NTAzMTUzODNmNmI5ZDUxMGI3Y2Q0ZTkyMjZjM2NkODgiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJuYmYiOjE2NTExMzEzNTAsImF1ZCI6IjIyNDY0NzQwMDE2Ni03c3JvdGVrbnJ1dmVtMDUxbm5yODVyZDI1ODNrYTU1by5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsInN1YiI6IjExNDUxNTcyNjQ4OTI1MzAxMDE5NCIsImhkIjoibXJwYXJrMS5jb20iLCJlbWFpbCI6ImVrZHJuMzMzMEBtcnBhcmsxLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhenAiOiIyMjQ2NDc0MDAxNjYtN3Nyb3Rla25ydXZlbTA1MW5ucjg1cmQyNTgza2E1NW8uYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJuYW1lIjoi6rmA7KeE7ZiBIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FBVFhBSnpycEcta1FQZmIzek43MC1RRk9QZ19zeTJEcF9VM2t2ay1ZaG04PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IuynhO2YgSIsImZhbWlseV9uYW1lIjoi6rmAIiwiaWF0IjoxNjUxMTMxNjUwLCJleHAiOjE2NTExMzUyNTAsImp0aSI6ImFhODk4ZjRmOGE0ZDA3Y2M1MTg0NTU3YzAyYjlkOTNmZDYxZGRjNWMifQ.k6lm8Pdg8BCyrYN8gsod0pfzvKXhGnQanbAQEohRXWNqsarxlnMlWYfY3Iu6mSQ8FemA4kNdph2sti322VwqnDCkEqdmk_jiBSC4YhsKdJfpmwmwuoScC6WueqGIor0O3-DgCp1u51vit2dS9Vx9C8tFdMJdf7HcLp8t1EbWJAO_RSj19-Az45II5tI9eBRRUEIoZoFXlCt59nskJBBEHaCwDetfaF5EtJ8hpqMz1JNZNdTC3-jtBza7bc9rYrm-g3qUGdeLbOQ2G-RoGJEv2jcK0ZN7a6jWHSoz71mZBz0aZ7yLiYU8_xRhlDKQPRDnFk4rTvGmRAfqIWnj-OFoPA';

// 나의 IDT를 세팅 후 GetMyInfo 호출
function SetNewIDT() {
    let Initializer =
    {
        client_id:'224647400166-7sroteknruvem051nnr85rd2583ka55o.apps.googleusercontent.com',
        auto_select:true,
        callback:Result => {window.localStorage.setItem('MyIDT', Result.credential); GetPartners(null);}
    };
    
    // test
    // console.log(Initializer);
    // console.log("Result:" + Result);

    google.accounts.id.initialize(Initializer);
    google.accounts.id.prompt();
}

// 파트너사의 주차장, 방문지를 보여준다.
function PartnersDetailPage(PartnerBN, num) {
    window.location.href = `PartnersDetail_${num}.html?PartnerBN=${PartnerBN}`;
}