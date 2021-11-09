import React from 'react';

function User({ user }) {
    //if (!user) return null; //에러는 발생하지 않게 됨
    //if (!user) return (<div>로딩중</div>)

    return (
        <>
            // 에러발생 1
            <div>
                <div>
                    <b>ID</b>: {user.id}
                </div>
                <div>
                    <b>Username</b>: {user.username}
                </div>
            </div>

            // 에러발생 2
            {/* <ul>
                {users.map(user => (
                <li key={user.id}>{user.username}</li>
                ))}
            </ul> */}
        </>
    );
}

export default User;