import React from 'react';

const profileData = {
  velopert: {
    name: '김민준',
    description : 'FrontEnd Engineer @ RIDI'
  },
  yuna: {
    name: '유나',
    description: 'publisher' 
  }
}
function Profile({ match }) {
    const { username } = match.params;
    const profile = profileData[username];
    if (!profile) {
      return <div>존재하지 않는 사용자 입니다.</div>
    }

    return (
      <div>
        <h3>{username} ({profile.name})</h3>
        <p>
          {profile.description}
        </p>
      </div>
    )
}

export default Profile;
