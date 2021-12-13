import React, { useEffect } from 'react';
// 컴포넌트가 처음 랜더링 될 때, 데이터를 요청해야 하니까, useEffect 사용
import { useUsersDispatch, useUsersState, getUser } from './UsersContext';


function User({ id }) { // 객체 형태로 받아와서 비구조화 할당을 할 것이기 떄문에
    const state = useUsersState();
    const dispatch = useUsersDispatch();

    useEffect(() => {
        getUser(dispatch, id);
    }, [dispatch, id]);

    const { loading, data: user, error} = state.user;
    // 유저의 정보를 불러 올 수 있는 상태
    if (loading) return <div>로딩중..</div>;
    if (error) return <div>에러 발생!</div>
    //아직 데이터가 없는 상황이다
    if (!user) return null;

    return (
        <div>
            <h2>{user.username}</h2>
            <p><b>Email : </b>{user.email}</p>
        </div>
    );
}

export default User;
