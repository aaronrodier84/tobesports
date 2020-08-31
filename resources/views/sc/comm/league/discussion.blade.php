@extends('sc.layouts.league.league')

@section('htmlheader_title')
{{ $league->name }}
@endsection

@section('page_id')league-discussion @endsection
@section('page_classes')league-discussion-page @endsection

@section('content')
  <div class="league-timeline-section mt10">
    @include('sc.comm.partials.timeline.timeline')
  </div>
@endsection
