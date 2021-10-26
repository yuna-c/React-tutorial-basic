import React from 'react';
//하나의 컴포넌트의 두개의 함수를 사용해도 상관 없다
function User({ user }) {
    return (
        <div>
            <b>
                {/* {users[0].username} */}
                {user.username}
            </b>
            <span>
                ({user.email})
            </span>
        </div>
    );
};


function UserList2() {
    //효율적인 방법
    const users = [
        {
            id : 1,
            username : 'velopert',
            email : 'public.vepopert@gmail.com'
        },
        {
            id : 2,
            username : 'tester',
            email : 'tester@example.com'
        },
        {
            id : 3,
            username : 'liz',
            email : 'liz@example.com'
        }
    ];

    return (
        <div>
           <User user={users[0]} />
           <User user={users[1]} />
           <User user={users[2]} /><br />
        </div>
    )
};

export default UserList2;