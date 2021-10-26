import React from 'react';
//user map
function User({ user, onRemove }) { //onRemove 받아오기
    //추출
    const { username, email, id } = user;
    return (
        <div>
            <b>
                {/* {users[0].username} */}
                {/* {user.username} */}
                {username}
            </b>
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
};


function UserList4({ users, onRemove }) {//삭제하는 props
    //user를 props로 받아오게끔
    return (
        <div>
           {
                users.map(
                    (user, index) => (
                        <User user={user} 
                        key={user.id} 
                        onRemove={onRemove} 
                    />
                )
            )
           }
        </div>
    )
};

export default UserList4;