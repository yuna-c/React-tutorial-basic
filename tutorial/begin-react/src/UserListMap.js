import React from 'react';

//새로운 컴포넌트 만들기
function User({ user }){
    return (
        <div>
            <b>{user.username}</b> <span>({user.email})</span>
        </div>
    );
}

function UserList() {
    const users = [
        {
            id: 1, //아이디 값을 키로 설정해 줘야함
            username: 'velopert',
            email: 'public.velopert@gmail.com'
        },
        {
            id: 2,
            username: 'tester',
            email: 'tester@example.com'
        },
        {
            id: 3,
            username: 'liz',
            email: 'liz@example.com'
        }
    ];

    return (
        <div>
            {
                users.map(
                    //id가 없을때는 index값을 사용해도 된다
                    //user => (<User user={user} key={user.id} />)
                    (user, index) => (<User user={user} key={index} />)
                )
            }
        </div>
    )
};

export default UserList;