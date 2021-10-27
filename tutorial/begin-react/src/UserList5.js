import React, { useEffect } from 'react';
//user map
const User = React.memo(function User({ user, onRemove, onToggle }) { //onRemove 받아오기
    //추출
    const { username, email, id, active } = user;
    console.log(user);
    // 첫번째 파라미터 = 실행하고픈 함수, deps
    /*
    useEffect(() => {
        console.log('컴포넌트가 화면에 나타납니다.');
        // 마운트 될 때 추가하는작업
        // props => state 설정
        // REST API
        // D3 Video.js 사용시
        // setInterval, setTimeout
        return () => {
            console.log('컴포넌트가 화면에서 사라졌습니다.');
            // 언마운트 될 때 추가하는 작업 
            // clearInterval, clearTimeout
            // 라이브러리 인스턴스 제거
        }
    }, []);// 배열 deps(props, 상태)
    */
   /* 
    useEffect(() => { //마운트 될때도 user값이 나타남
        console.log('user값이 설정됨');
        console.log(user);
        return () => {// 뒷정리 함수
            console.log('user값이 바뀌기 전');
            console.log(user);
        }
   }, [user]);
   */
  
    useEffect(() => { //하나를 눌러도 모든 컴포넌트에서 호출됨
        console.log(user);
    })
    /* 실 사용 예시
    useEffect(() => {
        loadPost(username, urlSlug);
    }, [username, urlSlug]);
    */
    return (
        <div>
            <b style={{
                    color : active ? 'green' : 'black',
                    cursor : 'pointer'
                }}
                onClick={() =>onToggle(id)}
            >
                {/* {users[0].username} */}
                {/* {user.username} */}
                {username}
            </b>
            &nbsp;
            <span>
                ({email})
            </span>
            <button onClick={()=>onRemove(id)}> 
            {/* 함수를 새로 만들어서 호출 */}
                {/* 버튼이 눌렀을때는 prop를 id값을 넣어서 호출할꺼다 */}
                삭제 
            </button>
        </div>
    );
});


function UserList5({ users, onRemove, onToggle }) {//삭제하는 props
    //user를 props로 받아오게끔
    return (
        <div>
           {
                users.map(
                    (user, index) => (
                        <User user={user} 
                        key={user.id} 
                        onRemove={onRemove} 
                        onToggle={onToggle}
                    />
                )
            )
           }
        </div>
    )
};

export default React.memo(
    UserList5, 
    (prevProps, nextProps) => nextProps.users === prevProps.users
    // 나머지 prop가 고정적이어서 업데이트 할 필요 없는건지 확인
);