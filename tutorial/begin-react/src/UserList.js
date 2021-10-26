import React from 'react';

function UserList() {
    //비효율적인 방법
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
            <div>
                <b>{users[0].username}</b><span>({users[0].email})</span><br/>
            </div>
            <div>
                <b>{users[1].username}</b><span>({users[1].email})</span><br/>
            </div>
            <div>
                <b>{users[2].username}</b><span>({users[2].email})</span><br/>
            </div><br />
        </div>
    )
};

export default UserList;