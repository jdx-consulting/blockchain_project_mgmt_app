import { Link } from 'react-router-dom'
import React from "react";

export const Header = () => (
    <header>
        <nav>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <Link class="nav-link" to='/'>Home</Link>
                </li>
                <li class="nav-item">
                    <Link class="nav-link" to='/entry'>Time Entry</Link>
                </li>
                <li class="nav-item">
                    <Link class="nav-link" to='/report'>Reporting</Link>
                </li>
                <li class="nav-item">
                    <Link class="nav-link" to='/approve'>Approval</Link>
                </li>
            </ul>
        </nav>
    </header>
)