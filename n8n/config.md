Can update the config json env variables by running this command to get all env from this site:
[https://docs.n8n.io/reference/environment-variables.html](https://docs.n8n.io/reference/environment-variables.html)

JS Code to execute inside browser console:

```js
copy(
  [...document.querySelectorAll('tr')]
    .map((e) => {
      const key = e.querySelector('td:nth-child(1)')?.innerText.replace('/_FILE', '').trim();
      const t = e.querySelector('td:nth-child(2)')?.innerText.toLowerCase().trim();
      if (!key) {
        return;
      }
      if (t === 'boolean') {
        return `${key}: bool?`;
      }
      if (t === 'number') {
        return `${key}: int?`;
      }
      if (t.includes('enum')) {
        return `${key}: list(${t
          .split(':')
          .pop()
          .split(',')
          .map((s) => s.trim())
          .join('|')})?`;
      }
      return `${key}: str?`;
    })
    .filter((s) => !!s)
    .sort()
    .join(',\n')
);
```
