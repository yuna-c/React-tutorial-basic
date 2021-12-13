import React, { useState } from 'react';
import User from './User';
import { getUsers, useUsersDispatch, useUsersState } from './UsersContext';

function Users() { 
    // user id 상태로 관리해 줄것
    const [userId, setUserid] = useState(null);
    const state = useUsersState();
    const dispatch = useUsersDispatch();

    const { loading, data: users , error } = state.users;

    const fetchData = () => {
        getUsers(dispatch);
    };
    if (loading) return <div>로딩중...</div>
    if (error) return <div>에러가 발생했습니다</div>
    if (!users) return <button onClick={fetchData}>불러오기</button>; // users에 배열이 유효하지 않은 값 이라면 아무것도 안보여지게 된다

    // users에 제대로 된 배열이 담겨있는 상태

    return (
        <>
            <ul>
                {users.map(user => <li key={user.id} onClick={() => setUserid(user.id)}>
                    {user.username} ({user.name})
                </li>)}
            </ul>

            <button onClick={fetchData}>다시 불러오기!</button>

            {/* null일때는 user component를 가져오지 않을 것이고, 만약 user id를 선택해서 해당 값이 유효 할 때, user component를 보여준다  */}
            {userId && <User id={userId} />}
        </>
    )
}

export default Users;
