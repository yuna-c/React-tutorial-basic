import React from 'react';

function User({ user }) {
    // if( !user ) return null;
    // if( !user ) return (
    //     <div>에러 발생!</div>
    // )
    return (
        <div>
            <div>
                <b>ID</b> : {user.id}
            </div>
            <div>
                <b>Username</b> : {user.username}
            </div>
        </div>

        // <ul>
        //     {users.mpa(user => (
        //         <li ley={user.id}>{user.usename}</li>
        //     ))}
        // </ul>
    );
}

export default User;