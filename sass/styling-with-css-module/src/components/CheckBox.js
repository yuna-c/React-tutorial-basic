import React from 'react';
import { MdCheckBox, MdCheckBoxOutlineBlank } from 'react-icons/md';
import styles from './CheckBox.module.css';
import classNames from 'classnames/bind';
// bind : CSS 모듈을 사용할 때, 조금 더 쉽게 사용할 수 있게하는 유틸리티

// console.log(styles);
const cx = classNames.bind(styles);

function CheckBox({ children, checked, ...rest }) {
    const color = 'blue';
    return (
        <div className={cx('checkbox', color)}>
            <label>
                <input type="checkbox" checked={checked} {...rest} />
                <div className={cx('icon')}>{checked ? <MdCheckBox className={cx(checked)}/> : <MdCheckBoxOutlineBlank />}</div>
            </label>
            <span>{children}</span>
        </div>
    );
}

export default CheckBox;