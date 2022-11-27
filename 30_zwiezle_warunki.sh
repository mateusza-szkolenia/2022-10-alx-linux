#!/bin/bash

read "imię: " imie

[ "$imie" == "Mateusz" ] && echo OK || echo NIE
