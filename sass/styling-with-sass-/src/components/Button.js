import React from 'react';
import classNames from 'classnames';
import './Button.scss';


// size : large, medium, small
// color : blue, pink, gray
function Button({ children, size, color, outline, fullWidth, className, ...rest }) { //props //outline, fullWidth : boolean = 배열형식으로 
    // console.log(rest);
    return (
        <>
            <button className={classNames(
                'Button', 
                size, 
                color, 
                {
                    outline,
                    fullWidth
                }, 
                className
                )}
                {...rest} // rest 안에 있는 모든것들을 rest안에 설정
            >
                {children}
            </button>
        </>
        // <button className={`Button ${size}`}>{children}</button>
    // "Button medium"
    )
}
Button.defaultProps = {
    size: 'medium',
    color: 'blue'
};

export default Button;
