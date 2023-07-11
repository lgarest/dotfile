const ERROR = 'error'
const WARNING = 'warn'

/** @type {import("eslint").Linter.Config} */
module.exports = {
  ignorePatterns: ['cypress'],
  overrides: [
    {
      extends: ['plugin:@typescript-eslint/recommended-requiring-type-checking'],
      files: ['*.ts', '*.tsx'],
      parserOptions: {
        project: ['tsconfig.json', 'cypress/tsconfig.json'],
      },
    },
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    project: './tsconfig.json',
  },
  plugins: ['@typescript-eslint'],
  extends: [
    'next/core-web-vitals',
    'plugin:@typescript-eslint/recommended',
    'eslint:recommended',
    'prettier',
  ],
  rules: {
    '@typescript-eslint/consistent-type-imports': [
      WARNING,
      {
        prefer: 'type-imports',
        fixStyle: 'inline-type-imports',
      },
    ],
    'no-unused-vars': 'off',
    '@typescript-eslint/no-unused-vars': [
      ERROR,
      {
        ignoreRestSiblings: true,
        argsIgnorePattern: '^_',
        varsIgnorePattern: '^_',
      },
    ],
    '@typescript-eslint/ban-ts-comment': [
      WARNING,
      {
        'ts-ignore': 'allow',
        'ts-nocheck': 'allow',
      },
    ],
  },
}
