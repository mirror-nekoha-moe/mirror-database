#!/bin/bash

# Example .env generator
sed 's/=.*/=/' .env > .env.example
