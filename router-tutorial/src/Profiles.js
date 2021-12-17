import React from 'react';
import Profile from './Profile';
import { Link, Route } from 'react-router-dom';
import RouterHookSapmle from './RouterHookSapmle';

function Profiles() {
    return (
        <div>
            <h3>사용자 목록</h3>
            <ul>
                <li><Link to="/profliles/velopert">velopert</Link></li>
                <li><Link to="/profliles/yuna">yuna</Link></li>
            </ul>

            <Route path="/profiles" render={() => <div>사용자를 선택해 주세요</div>} />
            <Route path="/profiles/:username" element={<Profile/>} />
            <RouterHookSapmle />
        </div>
    )
}

export default Profiles;
