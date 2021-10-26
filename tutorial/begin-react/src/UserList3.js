import React from 'react';
//user map
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


function UserList3() {
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
           {/* <User user={users[0]} />
           <User user={users[1]} />
           <User user={users[2]} /> */}
           {
               users.map(
                   // user => (<User user={user} key={user.id} />)
                   // key 라는 props는 각 원소들마다 고유값을 주는 것
                   // 고유 값이 없을 때는?? 두번째 파라미터의 index값을 사용해도 됨
                   (user, index) => (<User user={user} key={index} />)
                )
           }
        </div>
    )
};

export default UserList3;