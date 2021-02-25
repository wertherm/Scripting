from __future__ import unicode_literals
import youtube_dl

def my_hook(d):
	if d['status'] == 'finished':
		print(d['filename'] + ' Finalizado!')
	if d['status'] == 'downloading':
		print(d['_percent_str'])

ydl_opts = {
	'format': 'best',
	'outtmpl': '/volumes/werther/Videos/%(title)s.%(ext)s',
	'quiet': True,
	'no_warnings': False,
	'progress_hooks': [my_hook]
}

with youtube_dl.YoutubeDL(ydl_opts) as ydl:
	ydl.download(['https://www.youtube.com/watch?v=hS5CfP8n_js'])