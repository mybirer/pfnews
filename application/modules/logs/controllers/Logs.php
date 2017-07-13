<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Logs extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Logs_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));
        
        if ($q <> '') {
            $config['base_url'] = base_url() . 'logs/index.html?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'logs/index.html?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'logs/index.html';
            $config['first_url'] = base_url() . 'logs/index.html';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->Logs_model->total_rows($q);
        $logs = $this->Logs_model->get_limit_data($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'logs_data' => $logs,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $this->load->view('logs/pf_logs_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Logs_model->get_by_id($id);
        if ($row) {
            $data = array(
		'pklog' => $row->pklog,
		'module_name' => $row->module_name,
		'action' => $row->action,
		'description' => $row->description,
		'created_at' => $row->created_at,
		'created_by' => $row->created_by,
		'usertype' => $row->usertype,
		'ip' => $row->ip,
	    );
            $this->load->view('logs/pf_logs_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('logs'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('logs/create_action'),
	    'pklog' => set_value('pklog'),
	    'module_name' => set_value('module_name'),
	    'action' => set_value('action'),
	    'description' => set_value('description'),
	    'created_at' => set_value('created_at'),
	    'created_by' => set_value('created_by'),
	    'usertype' => set_value('usertype'),
	    'ip' => set_value('ip'),
	);
        $this->load->view('logs/pf_logs_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'module_name' => $this->input->post('module_name',TRUE),
		'action' => $this->input->post('action',TRUE),
		'description' => $this->input->post('description',TRUE),
		'created_at' => $this->input->post('created_at',TRUE),
		'created_by' => $this->input->post('created_by',TRUE),
		'usertype' => $this->input->post('usertype',TRUE),
		'ip' => $this->input->post('ip',TRUE),
	    );

            $this->Logs_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('logs'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Logs_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('logs/update_action'),
		'pklog' => set_value('pklog', $row->pklog),
		'module_name' => set_value('module_name', $row->module_name),
		'action' => set_value('action', $row->action),
		'description' => set_value('description', $row->description),
		'created_at' => set_value('created_at', $row->created_at),
		'created_by' => set_value('created_by', $row->created_by),
		'usertype' => set_value('usertype', $row->usertype),
		'ip' => set_value('ip', $row->ip),
	    );
            $this->load->view('logs/pf_logs_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('logs'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('pklog', TRUE));
        } else {
            $data = array(
		'module_name' => $this->input->post('module_name',TRUE),
		'action' => $this->input->post('action',TRUE),
		'description' => $this->input->post('description',TRUE),
		'created_at' => $this->input->post('created_at',TRUE),
		'created_by' => $this->input->post('created_by',TRUE),
		'usertype' => $this->input->post('usertype',TRUE),
		'ip' => $this->input->post('ip',TRUE),
	    );

            $this->Logs_model->update($this->input->post('pklog', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('logs'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Logs_model->get_by_id($id);

        if ($row) {
            $this->Logs_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('logs'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('logs'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('module_name', 'module name', 'trim|required');
	$this->form_validation->set_rules('action', 'action', 'trim|required');
	$this->form_validation->set_rules('description', 'description', 'trim|required');
	$this->form_validation->set_rules('created_at', 'created at', 'trim|required');
	$this->form_validation->set_rules('created_by', 'created by', 'trim|required');
	$this->form_validation->set_rules('usertype', 'usertype', 'trim|required');
	$this->form_validation->set_rules('ip', 'ip', 'trim|required');

	$this->form_validation->set_rules('pklog', 'pklog', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}

/* End of file Logs.php */
/* Location: ./application/controllers/Logs.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-07-13 06:34:28 */
/* http://harviacode.com */