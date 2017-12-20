clc;
clear all;

a = [ 1      2     0.05
2      2     0.10
3      2     0.15
4      2     0.20
5      2     0.26
6      2     0.31
7      2     0.36
8      2     0.41
9      2     0.46
10      2     0.51
11      2     0.56
12      2     0.61
13      2     0.67
14      2     0.72
15      2     0.77
16      2     0.82
17      2     0.87
18      2     0.92
19      2     0.97
20      2     1.03
21      2     1.08
22      2     1.13
23      2     1.18
24      2     1.23
25      2     1.28
26      2     1.33
27      2     1.38
28      2     1.44
29      2     1.49
30      2     1.54
31      2     1.59
32      2     1.64
33      2     1.69
34      2     1.74
35      2     1.80
36      2     1.85
37      2     1.90
38      2     1.95
39      2     2.00
40      2     2.05
41      2     2.10
42      2     2.16
43      2     2.21
44      2     2.26
45      2     2.31
46      2     2.36
47      2     2.41
48      2     2.46
49      2     2.51
50      2     2.57
51      2     2.62
52      2     2.67
53      2     2.72
54      2     2.77
55      2     2.82
56      2     2.87
57      2     2.93
58      2     2.98
59      2     3.03
60      2     3.08
61      2     3.13
62      2     3.18
63      2     3.23
64      2     3.28
65      2     3.34
66      2     3.39
67      2     3.44
68      2     3.49
69      2     3.54
70      2     3.59
71      2     3.65
72      2     3.70
73      2     3.75
74      2     3.80
75      2     3.85
76      2     3.90
77      2     3.95
78      2     4.00
79      2     4.06
80      2     4.11
81      2     4.16
82      2     4.21
83      2     4.26
84      2     4.31
85      2     4.36
86      2     4.42
87      2     4.47
88      2     4.52
89      2     4.57
90      2     4.62
91      2     4.67
92      2     4.72
93      2     4.77
94      2     4.83
95      2     4.88
96      2     4.93
97      2     4.98
98      2     5.03
99      2     5.08
100      2     5.13
101      2     5.19
102      2     5.24
103      2     5.29
104      2     5.34
105      2     5.39
106      2     5.44
107      2     5.49
108      2     5.54
109      2     5.60
110      2     5.65
111      2     5.70
112      3     5.75
113      7     5.80
114      10     5.85
115      14     5.91
116      18     5.96
117      23     6.01
118      35     6.06
119      36     6.12
120      41     6.17
121      46     6.22
122      877     6.28
123      861     6.38
124      3     6.61
125      89     6.67
126      872     6.72
127      3     6.96
128      118     7.01
129      127     7.07
130      130     7.12
131      135     7.18
132      140     7.24
133      111     7.30
134      149     7.36
135      155     7.42
136      164     7.48
137      235     7.54
138      234     7.61
139      241     7.67
140      873     7.74
141      3     7.97
142      247     8.02
143      859     8.09
144      3     8.32
145      252     8.38
146      236     8.44
147      255     8.51
148      255     8.57
149      261     8.64
150      869     8.71
151      3     8.94
152      843     8.99
153      3     9.22
154      879     9.27
155      3     9.51
156      242     9.56
157      847     9.63
158      3     9.86
159      838     9.91
160      3     10.14
161      866     10.19
162      3     10.43
163      852     10.48
164      3     10.71
165      226     10.77
166      231     10.83
167      829     10.90
168      3     11.13
169      859     11.18
170      3     11.41
171      204     11.46
172      865     11.53
173      3     11.76
174      858     11.81
175      3     12.05
176      174     12.10
177      158     12.16
178      157     12.22
179      155     12.28
180      153     12.34
181      155     12.40
182      144     12.46
183      145     12.52
184      130     12.58
185      151     12.64
186      139     12.70
187      118     12.76
188      140     12.82
189      118     12.88
190      117     12.94
191      118     12.99
192      118     13.05
193      131     13.11
194      103     13.17
195      93     13.23
196      123     13.28
197      119     13.34
198      108     13.40
199      81     13.46
200      81     13.52
201      81     13.57
202      80     13.63
203      80     13.68
204      81     13.74
205      81     13.80
206      81     13.85
207      81     13.91
208      80     13.96
209      81     14.02
210      80     14.08
211      81     14.13
212      80     14.19
213      82     14.24
214      81     14.30
215      111     14.36
216      81     14.42
217      114     14.47
218      81     14.53
219      81     14.59
220      114     14.64
221      82     14.70
222      81     14.76
223      82     14.81
224      81     14.87
225      81     14.92
226      82     14.98
227      81     15.04
228      81     15.09
229      81     15.15
230      82     15.21
231      81     15.26
232      118     15.32
233      115     15.38
234      81     15.43
235      81     15.49
236      81     15.55
237      81     15.60
238      81     15.66
239      80     15.72
240      81     15.77
241      81     15.83
242      81     15.88
243      81     15.94
244      80     16.00
245      80     16.05
246      81     16.11
247      80     16.16
248      80     16.22
249      81     16.28
250      80     16.33
251      80     16.39
252      81     16.44
253      80     16.50
254      80     16.56
255      80     16.61
256      80     16.67
257      80     16.72
258      80     16.78
259      80     16.84
260      80     16.89
261      80     16.95
262      80     17.00
263      80     17.06
264      80     17.12
265      80     17.17
266      80     17.23
267      80     17.28
268      80     17.34
269      81     17.40
270      81     17.45
271      80     17.51
272      80     17.56
273      80     17.62
274      81     17.68
275      81     17.73
276      81     17.79
277      81     17.85
278      79     17.90
279      79     17.96
280      80     18.01
281      80     18.07
282      80     18.13
283      80     18.18
284      80     18.24
285      80     18.29
286      80     18.35
287      88     18.41
288      87     18.46
289      853     18.52
290      3     18.75
291      109     18.80
292      109     18.86
293      72     18.92
294      108     18.98
295      71     19.03
296      71     19.09
297      855     19.14
298      3     19.38
299      836     19.43
300      3     19.66
301      838     19.71
302      3     19.95
303      69     20.00
304      68     20.05
305      68     20.11
306      68     20.16
307      68     20.22
308      68     20.27
309      69     20.33
310      69     20.38
311      69     20.44
312      69     20.50
313      89     20.55
314      70     20.61
315      70     20.66
316      71     20.72
317      69     20.77
318      73     20.83
319      70     20.88
320      68     20.94
321      68     21.00
322      68     21.05
323      68     21.11
324      67     21.16
325      67     21.22
326      67     21.27
327      67     21.33
328      67     21.38
329      67     21.44
330      68     21.49
331      68     21.55
332      68     21.60
333      68     21.66
334      70     21.71
335      852     21.77
336      3     22.00
337      845     22.05
338      3     22.29
339      68     22.34
340      68     22.39
341      68     22.45
342      68     22.51
343      68     22.56
344      68     22.62
345      68     22.67
346      67     22.73
347      67     22.78
348      67     22.84
349      67     22.89
350      67     22.95
351      67     23.00
352      67     23.06
353      67     23.11
354      67     23.17
355      67     23.23
356      67     23.28
357      67     23.34
358      68     23.39
359      68     23.45
360      68     23.50
361      68     23.56
362      68     23.61
363      68     23.67
364      68     23.72
365      68     23.78
366      68     23.83
367      69     23.89
368      69     23.95
369      69     24.00
370      68     24.06
371      69     24.11
372      70     24.17
373      866     24.22
374      3     24.46
375      69     24.51
376      71     24.56
377      88     24.62
378      88     24.68
379      69     24.73
380      69     24.79
381      68     24.84
382      68     24.90
383      68     24.95
384      67     25.01
385      67     25.06
386      67     25.12
387      67     25.17
388      67     25.23
389      67     25.28
390      67     25.34
391      67     25.40
392      67     25.45
393      67     25.51
394      67     25.56
395      67     25.62
396      67     25.67
397      67     25.73
398      67     25.78
399      67     25.84
400      67     25.89
401      67     25.95
402      68     26.00
403      68     26.06
404      68     26.12
405      68     26.17
406      67     26.23
407      67     26.28
408      67     26.34
409      67     26.39
410      68     26.45
411      68     26.50
412      67     26.56
413      68     26.61
414      67     26.67
415      67     26.72
416      67     26.78
417      67     26.83
418      68     26.89
419      67     26.94
420      67     27.00
421      67     27.06
422      67     27.11
423      67     27.17
424      67     27.22
425      67     27.28
426      67     27.33
427      67     27.39
428      67     27.44
429      67     27.50
430      67     27.55
431      67     27.61
432      67     27.66
433      67     27.72
434      67     27.77
435      67     27.83
436      67     27.88
437      67     27.94
438      70     28.00
439      863     28.05
440      3     28.28
441      68     28.34
442      87     28.39
443      88     28.45
444      88     28.51
445      88     28.56
446      88     28.62
447      87     28.67
448      86     28.73
449      880     28.79
450      3     29.02
451      81     29.07
452      76     29.13
453      71     29.19
454      893     29.24
455      3     29.48
456      64     29.53
457      65     29.58
458      65     29.64
459      65     29.69
460      65     29.75
461      67     29.80
462      67     29.86
463      68     29.92
464      66     29.97
465      65     30.02
466      65     30.08
467      65     30.14
468      66     30.19
469      67     30.25
470      68     30.30
471      67     30.36
472      64     30.41
473      63     30.47
474      64     30.52
475      63     30.58
476      63     30.63
477      64     30.69
478      65     30.74
479      66     30.80
480      65     30.85
481      65     30.91
482      65     30.96
483      65     31.02
484      65     31.07
485      65     31.13
486      65     31.18
487      65     31.24
488      837     31.29
489      3     31.53
490      84     31.58
491      108     31.63
492      86     31.69
493      87     31.75
494      110     31.81
495      114     31.86
496      879     31.92
497      3     32.16
498      107     32.21
499      117     32.27
500      117     32.32
501      118     32.38
502      115     32.44
503      116     32.50]

subplot(4,1,1);

plot(a(:,3),a(:,2))

b = [0      2     0.00
1      2     0.05
2      2     0.10
3      2     0.15
4      2     0.20
5      2     0.26
6      2     0.31
7      2     0.36
8      2     0.41
9      2     0.46
10      2     0.51
11      2     0.56
12      2     0.61
13      2     0.67
14      2     0.72
15      2     0.77
16      2     0.82
17      2     0.87
18      2     0.92
19      2     0.97
20      2     1.03
21      2     1.08
22      2     1.13
23      2     1.18
24      2     1.23
25      2     1.28
26      2     1.33
27      2     1.38
28      2     1.44
29      2     1.49
30      2     1.54
31      2     1.59
32      2     1.64
33      2     1.69
34      2     1.74
35      2     1.80
36      2     1.85
37      2     1.90
38      2     1.95
39      2     2.00
40      2     2.05
41      2     2.10
42      2     2.16
43      2     2.21
44      2     2.26
45      2     2.31
46      2     2.36
47      2     2.41
48      2     2.46
49      2     2.51
50      2     2.57
51      2     2.62
52      2     2.67
53      2     2.72
54      2     2.77
55      2     2.82
56      2     2.87
57      2     2.93
58      2     2.98
59      2     3.03
60      2     3.08
61      2     3.13
62      2     3.18
63      2     3.23
64      2     3.29
65      2     3.34
66      2     3.39
67      2     3.44
68      2     3.49
69      2     3.54
70      2     3.59
71      2     3.65
72      2     3.70
73      2     3.75
74      2     3.80
75      2     3.85
76      2     3.90
77      2     3.95
78      2     4.00
79      2     4.06
80      2     4.11
81      2     4.16
82      2     4.21
83      2     4.26
84      2     4.31
85      2     4.36
86      2     4.42
87      2     4.47
88      2     4.52
89      2     4.57
90      2     4.62
91      2     4.67
92      2     4.72
93      2     4.77
94      2     4.83
95      2     4.88
96      2     4.93
97      2     4.98
98      2     5.03
99      2     5.08
100      2     5.13
101      2     5.19
102      2     5.24
103      2     5.29
104      2     5.34
105      2     5.39
106      2     5.44
107      3     5.49
108      4     5.55
109      7     5.60
110      9     5.65
111      13     5.70
112      18     5.75
113      23     5.80
114      31     5.86
115      250     5.91
116      42     5.98
117      883     6.03
118      3     6.26
119      75     6.32
120      82     6.37
121      207     6.43
122      91     6.49
123      96     6.55
124      102     6.61
125      108     6.66
126      111     6.72
127      116     6.78
128      119     6.84
129      127     6.90
130      133     6.95
131      142     7.01
132      205     7.07
133      207     7.14
134      156     7.20
135      203     7.26
136      167     7.32
137      203     7.39
138      204     7.45]

subplot(4,1,2);
plot(b(:,3),b(:,2))

c = [1      2     0.03
2      2     0.05
3      1     0.08
4      2     0.10
5      2     0.13
6      2     0.16
7      2     0.18
8      2     0.21
9      2     0.23
10      2     0.26
11      2     0.29
12      1     0.31
13      2     0.34
14      2     0.37
15      2     0.39
16      2     0.42
17      2     0.45
18      2     0.47
19      1     0.50
20      2     0.52
21      2     0.55
22      2     0.58
23      2     0.60
24      2     0.63
25      2     0.66
26      1     0.68
27      2     0.71
28      2     0.74
29      2     0.76
30      2     0.79
31      2     0.81
32      2     0.84
33      1     0.87
34      2     0.89
35      2     0.92
36      2     0.95
37      2     0.97
38      2     1.00
39      2     1.03
40      1     1.05
41      2     1.08
42      2     1.10
43      2     1.13
44      2     1.16
45      2     1.18
46      2     1.21
47      1     1.24
48      2     1.26
49      2     1.29
50      2     1.32
51      2     1.34
52      2     1.37
53      2     1.39
54      1     1.42
55      2     1.45
56      2     1.47
57      2     1.50
58      2     1.52
59      2     1.55
60      2     1.58
61      1     1.61
62      2     1.63
63      2     1.66
64      2     1.68
65      2     1.71
66      2     1.74
67      2     1.76
68      1     1.79
69      2     1.82
70      2     1.84
71      2     1.87
72      2     1.89
73      2     1.92
74      2     1.95
75      2     1.97
76      2     2.00
77      2     2.03
78      2     2.05
79      2     2.08
80      2     2.11
81      2     2.13
82      2     2.16
83      2     2.18
84      2     2.21
85      2     2.24
86      1     2.26
87      2     2.29
88      2     2.32
89      2     2.34
90      2     2.37
91      2     2.40
92      2     2.42
93      1     2.45
94      2     2.47
95      2     2.50
96      2     2.53
97      2     2.55
98      2     2.58
99      2     2.61
100      1     2.63
101      2     2.66
102      2     2.68
103      2     2.71
104      1     2.74
105      2     2.76
106      2     2.79
107      2     2.82
108      2     2.84
109      2     2.87
110      2     2.90
111      2     2.92
112      2     2.95
113      2     2.97
114      2     3.00
115      2     3.03
116      2     3.05
117      2     3.08
118      2     3.11
119      2     3.13
120      2     3.16
121      1     3.19
122      2     3.21
123      2     3.24
124      2     3.27
125      1     3.29
126      2     3.32
127      2     3.34
128      2     3.37
129      2     3.40
130      2     3.42
131      2     3.45
132      2     3.48
133      2     3.50
134      2     3.53
135      2     3.56
136      2     3.58
137      2     3.61
138      1     3.63
139      2     3.66
140      2     3.69
141      2     3.71
142      1     3.74
143      2     3.77
144      2     3.79
145      2     3.82
146      1     3.85
147      2     3.87
148      2     3.90
149      2     3.92
150      2     3.95
151      2     3.98
152      2     4.00
153      2     4.03
154      2     4.06
155      2     4.08
156      2     4.11
157      2     4.14
158      2     4.16
159      1     4.19
160      2     4.21
161      2     4.24
162      2     4.27
163      1     4.29
164      2     4.32
165      2     4.35
166      2     4.37
167      2     4.40
168      2     4.43
169      2     4.45
170      2     4.48
171      2     4.51
172      2     4.53
173      2     4.56
174      2     4.58
175      2     4.61
176      1     4.64
177      2     4.66
178      2     4.69
179      2     4.72
180      1     4.74
181      2     4.77
182      2     4.80
183      2     4.82
184      1     4.85
185      2     4.87
186      2     4.90
187      2     4.93
188      2     4.95
189      2     4.98
190      2     5.01
191      4     5.03
192      5     5.06
193      7     5.09
194      8     5.11
195      10     5.14
196      12     5.17
197      14     5.19
198      16     5.22
199      18     5.25
200      21     5.28
201      24     5.30
202      31     5.33
203      632     5.36
204      38     5.42
205      41     5.45
206      43     5.48
207      46     5.51
208      50     5.54
209      54     5.57
210      54     5.60
211      230     5.63
212      881     5.80
213      3     6.01
214      96     6.03
215      260     6.07
216      260     6.11
217      117     6.15
218      842     6.18
219      3     6.39
220      136     6.42
221      135     6.45
222      138     6.48
223      142     6.52
224      881     6.55
225      3     6.76
226      247     6.79
227      869     6.83
228      3     7.04
229      249     7.07
230      227     7.11]

subplot(4,1,3);
plot(c(:,3),c(:,2))

d = [1      2     0.03
2      2     0.05
3      2     0.08
4      2     0.10
5      2     0.13
6      2     0.16
7      2     0.18
8      2     0.21
9      2     0.24
10      2     0.26
11      2     0.29
12      2     0.31
13      2     0.34
14      2     0.37
15      2     0.39
16      2     0.42
17      2     0.45
18      2     0.47
19      2     0.50
20      2     0.53
21      2     0.55
22      2     0.58
23      2     0.61
24      2     0.63
25      2     0.66
26      2     0.69
27      2     0.71
28      2     0.74
29      2     0.76
30      2     0.79
31      2     0.82
32      2     0.84
33      2     0.87
34      2     0.90
35      2     0.92
36      2     0.95
37      2     0.97
38      2     1.00
39      2     1.03
40      2     1.05
41      2     1.08
42      2     1.11
43      2     1.13
44      2     1.16
45      2     1.18
46      2     1.21
47      2     1.24
48      2     1.26
49      2     1.29
50      2     1.32
51      2     1.34
52      2     1.37
53      2     1.40
54      2     1.42
55      2     1.45
56      2     1.48
57      2     1.50
58      2     1.53
59      2     1.55
60      2     1.58
61      2     1.61
62      2     1.63
63      2     1.66
64      2     1.69
65      2     1.71
66      2     1.74
67      2     1.77
68      2     1.79
69      2     1.82
70      2     1.85
71      2     1.87
72      2     1.90
73      2     1.92
74      2     1.95
75      2     1.98
76      2     2.00
77      2     2.03
78      2     2.06
79      2     2.08
80      2     2.11
81      2     2.14
82      2     2.16
83      2     2.19
84      2     2.21
85      2     2.24
86      2     2.27
87      2     2.29
88      2     2.32
89      2     2.35
90      2     2.37
91      2     2.40
92      2     2.42
93      2     2.45
94      2     2.48
95      2     2.50
96      2     2.53
97      2     2.56
98      2     2.58
99      2     2.61
100      2     2.64
101      2     2.66
102      2     2.69
103      2     2.72
104      2     2.74
105      2     2.77
106      2     2.79
107      2     2.82
108      2     2.85
109      2     2.87
110      2     2.90
111      2     2.93
112      2     2.95
113      2     2.98
114      2     3.01
115      2     3.03
116      2     3.06
117      2     3.09
118      2     3.11
119      2     3.14
120      2     3.16
121      2     3.19
122      2     3.22
123      2     3.24
124      2     3.27
125      2     3.30
126      2     3.32
127      2     3.35
128      2     3.38
129      2     3.40
130      2     3.43
131      2     3.45
132      2     3.48
133      2     3.51
134      2     3.53
135      2     3.56
136      2     3.59
137      2     3.61
138      2     3.64
139      2     3.67
140      2     3.69
141      2     3.72
142      2     3.74
143      2     3.77
144      2     3.80
145      2     3.82
146      2     3.85
147      2     3.88
148      2     3.90
149      2     3.93
150      2     3.96
151      2     3.98
152      2     4.01
153      2     4.03
154      2     4.06
155      2     4.09
156      2     4.11
157      2     4.14
158      2     4.17
159      2     4.19
160      2     4.22
161      2     4.25
162      2     4.27
163      2     4.30
164      2     4.33
165      2     4.35
166      2     4.38
167      2     4.41
168      2     4.43
169      2     4.46
170      2     4.49
171      2     4.51
172      2     4.54
173      2     4.56
174      2     4.59
175      2     4.62
176      2     4.64
177      2     4.67
178      2     4.70
179      2     4.72
180      2     4.75
181      2     4.77
182      2     4.80
183      2     4.83
184      2     4.85
185      2     4.88
186      2     4.91
187      2     4.93
188      2     4.96
189      2     4.99
190      2     5.01
191      2     5.04
192      2     5.07
193      2     5.09
194      2     5.12
195      2     5.15
196      2     5.17
197      2     5.20
198      2     5.22
199      3     5.25
200      4     5.28
201      5     5.30
202      7     5.33
203      8     5.36
204      11     5.38
205      13     5.41
206      15     5.44
207      17     5.47
208      19     5.49
209      22     5.52
210      26     5.55
211      30     5.57
212      33     5.60
213      38     5.63
214      187     5.66
215      43     5.70
216      46     5.73
217      50     5.75
218      50     5.78
219      52     5.81
220      55     5.84
221      57     5.87
222      61     5.90
223      198     5.93
224      67     5.97
225      198     6.00
226      75     6.04
227      200     6.07
228      199     6.11
229      84     6.15
230      199     6.18
231      91     6.21
232      94     6.25
233      199     6.28
234      198     6.32
235      103     6.35
236      199     6.39
237      112     6.42
238      117     6.46
239      117     6.49
240      121     6.52
241      123     6.56
242      128     6.59
243      200     6.63
244      134     6.66
245      141     6.70
246      141     6.73
247      143     6.77
248      146     6.80
249      149     6.84
250      915     6.87
251      3     7.08
252      876     7.11
253      3     7.32
254      202     7.34
255      883     7.38
256      3     7.59
257      203     7.62
258      204     7.66]

subplot(4,1,3);
plot(d(:,3),d(:,2))


e = [1      6     0.01
2      6     0.02
3      6     0.03
4      6     0.05
5      6     0.06
6      6     0.07
7      6     0.08
8      6     0.10
9      6     0.12
10      6     0.14
11      6     0.16
12      6     0.18
13      6     0.20
14      6     0.22
15      6     0.24
16      6     0.26
17      6     0.28
18      6     0.31
19      6     0.33
20      6     0.35
21      6     0.37
22      6     0.39
23      6     0.41
24      6     0.43
25      6     0.45
26      6     0.47
27      6     0.49
28      6     0.51
29      6     0.54
30      6     0.56
31      6     0.58
32      6     0.60
33      6     0.62
34      6     0.64
35      6     0.66
36      6     0.68
37      6     0.70
38      6     0.72
39      6     0.74
40      6     0.76
41      6     0.79
42      6     0.81
43      6     0.83
44      6     0.85
45      6     0.87
46      6     0.89
47      6     0.91
48      6     0.93
49      6     0.95
50      6     0.97
51      6     0.99
52      6     1.01
53      6     1.03
54      6     1.05
55      6     1.08
56      6     1.10
57      6     1.12
58      6     1.14
59      6     1.16
60      6     1.18
61      6     1.20
62      6     1.22
63      6     1.24
64      6     1.26
65      6     1.28
66      6     1.30
67      6     1.33
68      6     1.35
69      6     1.37
70      6     1.39
71      6     1.41
72      6     1.43
73      6     1.45
74      6     1.47
75      6     1.49
76      6     1.51
77      6     1.53
78      6     1.55
79      6     1.58
80      6     1.60
81      6     1.62
82      6     1.64
83      6     1.66
84      6     1.68
85      6     1.70
86      6     1.72
87      6     1.74
88      6     1.76
89      6     1.78
90      6     1.80
91      6     1.83
92      6     1.85
93      6     1.87
94      6     1.89
95      6     1.91
96      6     1.93
97      6     1.95
98      6     1.97
99      6     1.99
100      6     2.01
101      6     2.03
102      6     2.06
103      6     2.08
104      6     2.10
105      6     2.12
106      6     2.14
107      6     2.17
108      6     2.19
109      6     2.21
110      6     2.23
111      6     2.25
112      6     2.27
113      6     2.30
114      6     2.32
115      6     2.34
116      6     2.36
117      6     2.38
118      6     2.41
119      6     2.43
120      6     2.45
121      6     2.47
122      6     2.49
123      6     2.51
124      6     2.54
125      6     2.56
126      6     2.58
127      6     2.60
128      6     2.62
129      6     2.65
130      6     2.67
131      6     2.69
132      6     2.71
133      6     2.73
134      6     2.75
135      6     2.78
136      6     2.80
137      6     2.82
138      6     2.84
139      6     2.86
140      6     2.89
141      6     2.91
142      6     2.93
143      6     2.95
144      6     2.97
145      6     3.00
146      6     3.02
147      6     3.04
148      6     3.06
149      6     3.08
150      6     3.10
151      6     3.13
152      6     3.15
153      6     3.17
154      6     3.19
155      6     3.21
156      6     3.24
157      6     3.26
158      6     3.28
159      6     3.30
160      6     3.32
161      6     3.34
162      6     3.37
163      6     3.39
164      6     3.41
165      6     3.43
166      6     3.45
167      6     3.48
168      6     3.50
169      6     3.52
170      6     3.54
171      6     3.56
172      6     3.59
173      6     3.61
174      6     3.63
175      6     3.65
176      6     3.67
177      6     3.69
178      6     3.72
179      6     3.74
180      6     3.76
181      6     3.78
182      6     3.80
183      6     3.83
184      6     3.85
185      6     3.87
186      6     3.89
187      6     3.91
188      6     3.93
189      6     3.96
190      6     3.98
191      6     4.00
192      6     4.02
193      6     4.04
194      6     4.07
195      6     4.09
196      6     4.11
197      6     4.13
198      6     4.15
199      6     4.17
200      6     4.20
201      6     4.22
202      6     4.24
203      6     4.26
204      6     4.28
205      6     4.30
206      6     4.33
207      6     4.35
208      6     4.37
209      6     4.39
210      6     4.41
211      6     4.44
212      6     4.46
213      6     4.48
214      6     4.50
215      6     4.52
216      6     4.55
217      6     4.57
218      6     4.59
219      6     4.61
220      6     4.63
221      6     4.66
222      6     4.68
223      6     4.70
224      6     4.72
225      6     4.74
226      6     4.76
227      6     4.79
228      6     4.81
229      6     4.83
230      6     4.85
231      6     4.87
232      6     4.90
233      6     4.92
234      6     4.94
235      6     4.96
236      6     4.98
237      6     5.00
238      6     5.03
239      6     5.05
240      6     5.07
241      6     5.09
242      6     5.11
243      6     5.14
244      5     5.16
245      7     5.18
246      6     5.20
247      6     5.22
248      7     5.24
249      7     5.27
250      8     5.29
251      10     5.31
252      10     5.33
253      13     5.36
254      13     5.38
255      15     5.40
256      16     5.43
257      835     5.45
258      3     5.64
259      33     5.65
260      34     5.66
261      37     5.68
262      38     5.69
263      47     5.71
264      65     5.73
265      41     5.75
266      44     5.78
267      47     5.80
268      66     5.82
269      47     5.85
270      50     5.87
271      66     5.89
272      65     5.92
273      57     5.94
274      57     5.96
275      68     5.98
276      59     6.01
277      63     6.03
278      63     6.05
279      65     6.07
280      66     6.10
281      65     6.12
282      66     6.14
283      65     6.17
284      65     6.19
285      65     6.21
286      66     6.24
287      66     6.26
288      65     6.28
289      66     6.30
290      66     6.33
291      65     6.35
292      65     6.37
293      65     6.40
294      65     6.42
295      65     6.44
296      65     6.46
297      65     6.49
298      65     6.51
299      64     6.53
300      64     6.55
301      65     6.58
302      64     6.60
303      65     6.62
304      65     6.65
305      65     6.67
306      65     6.69
307      65     6.72
308      65     6.74
309      65     6.76
310      65     6.78]

subplot(4,1,4);
plot(e(:,3),e(:,2))

